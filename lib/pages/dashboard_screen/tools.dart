import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:path_provider/path_provider.dart';

import 'package:odinlab/pages/dashboard_screen/recogonizer.dart';

class Tools extends StatefulWidget {
  const Tools({super.key});

  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraActive = false;
  int? _sensorOrientation;
  bool _isRearCamera = true;

  @override
  void initState() {
    super.initState();
    _initializeCameraList();
  }

  Future<void> _initializeCameraList() async {
    _cameras = await availableCameras();
  }

  Future<void> _startCamera() async {
    if (_cameras == null || _cameras!.isEmpty || !mounted) return;

    try {
      _cameraController = CameraController(
        _cameras![0],
        ResolutionPreset.medium,
      );

      await _cameraController!.initialize();

      if (!mounted) return;

      _sensorOrientation = _cameras![0].sensorOrientation;
      _isRearCamera = _cameras![0].lensDirection == CameraLensDirection.back;

      setState(() => _isCameraActive = true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Camera error: ${e.toString()}')),
        );
      }
    }
  }

  Future<void> _stopCamera() async {
    await _cameraController?.dispose();
    if (mounted) {
      setState(() => _isCameraActive = false);
    }
  }

  Future<void> _captureImage() async {
    if (!_isCameraActive || _cameraController == null || !mounted) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Camera not active!')),
        );
      }
      return;
    }

    try {
      final image = await _cameraController!.takePicture();
      final exifImage = img.decodeImage(await File(image.path).readAsBytes());
      final orientedImage = img.bakeOrientation(exifImage!);

      final tempDir = await getTemporaryDirectory();
      final path =
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      await File(path).writeAsBytes(img.encodeJpg(orientedImage));

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Recognizer(File(path)),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Capture failed: ${e.toString()}')),
        );
      }
    }
  }

  double _calculatePreviewRotation(Size physicalSize) {
    if (_sensorOrientation == null) return 0;

    final aspectRatio = physicalSize.aspectRatio;
    final isLandscape = aspectRatio > 1;

    int rotation = 0;

    if (_isRearCamera) {
      rotation =
          (isLandscape ? _sensorOrientation! + 90 : _sensorOrientation!) % 360;
    } else {
      rotation = (isLandscape
          ? (360 - _sensorOrientation! - 90) % 360
          : (360 - _sensorOrientation!) % 360);
    }

    return rotation * (pi / 180);
  }

  @override
  void dispose() {
    _stopCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF45C7C1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionBarItem(Icons.scanner, "Scan"),
                _actionBarItem(Icons.document_scanner_outlined, "Recognize"),
                _actionBarItem(Icons.assignment_outlined, "Enhance"),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!_isCameraActive && mounted) {
                  _startCamera();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kBlackColor,
                ),
                child: _isCameraActive
                    ? LayoutBuilder(
                        builder: (context, constraints) {
                          final physicalSize = View.of(context).physicalSize;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Transform.rotate(
                              angle: _calculatePreviewRotation(physicalSize),
                              child: Center(
                                child: AspectRatio(
                                  aspectRatio:
                                      _cameraController!.value.aspectRatio,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CameraPreview(_cameraController!)),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt,
                                size: 50, color: Colors.white54),
                            SizedBox(height: 10),
                            Text(
                              "Tap to activate camera",
                              style: TextStyle(color: Colors.white54),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF45C7C1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomBarItem(Icons.rotate_left, 30, "Rotate", () {}),
                _bottomBarItem(
                    Icons.camera_alt, 40, "Take a picture", _captureImage),
                _bottomBarItem(
                  Icons.image_outlined,
                  30,
                  "Select image",
                  () async {
                    final currentContext = context;

                    final picker = ImagePicker();
                    final xfile =
                        await picker.pickImage(source: ImageSource.gallery);

                    if (xfile == null || !mounted || !currentContext.mounted) {
                      return;
                    }

                    Navigator.push(
                      currentContext,
                      MaterialPageRoute(
                        builder: (context) => Recognizer(File(xfile.path)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionBarItem(IconData icon, String text) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 25, color: Colors.white),
      label: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _bottomBarItem(
      IconData icon, double size, String tooltip, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      tooltip: tooltip,
      icon: Icon(icon, size: size, color: Colors.white),
    );
  }
}
