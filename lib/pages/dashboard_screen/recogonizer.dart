import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:lottie/lottie.dart';

import 'package:odinlab/constant/colors.dart';

class Recognizer extends StatefulWidget {
  final File image;
  const Recognizer(this.image, {super.key});

  @override
  State<Recognizer> createState() => _RecogonizerState();
}

class _RecogonizerState extends State<Recognizer> {
  bool _isLoading = true;
  late TextRecognizer textRecognizer;
  String results = "";

  @override
  void initState() {
    super.initState();
    _loadImage();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    doTextRecognition();
  }

  doTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    results = recognizedText.text;
    setState(() {
      results;
    });

    //for (TextBlock block in recognizedText.blocks) {
    //final Rect rect = block.boundingBox;
    //final List<Point<int>> cornerPoints = block.cornerPoints;
    //final String text = block.text;
    //final List<String> languages = block.recognizedLanguages;

    // for (TextLine line in block.lines) {
    //   for (TextElement element in line.elements) {}
    // }
    //}
  }

  void _loadImage() {
    final imageFile = File(widget.image.path);
    final imageStream =
        FileImage(imageFile).resolve(const ImageConfiguration());

    imageStream.addListener(
      ImageStreamListener(
        (info, synchronousCall) {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        },
        onError: (error, stackTrace) {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recognizer",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: _isLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: Lottie.asset(
                      "assets/lotties/loader.json",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            width: double.infinity,
                            color: kLightShadowColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  "assets/lotties/error.json",
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Error loading image.. Try again",
                                  style: TextStyle(color: kGreyColor),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Card(
                      shadowColor: kShadowColor,
                      elevation: 4,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? kBlackColor
                          : Colors.white24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color:
                                  Theme.of(context).appBarTheme.backgroundColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Results",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(text: results),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Lottie.asset(
                                                "assets/lotties/send.json",
                                                width: 80,
                                                fit: BoxFit.cover,
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 5,
                                                ),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                  color: kWhiteColor,
                                                ),
                                                child: const Text(
                                                  "Text copied to the clipboard",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: kBlackColor,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.copy),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            child: Text(results),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
