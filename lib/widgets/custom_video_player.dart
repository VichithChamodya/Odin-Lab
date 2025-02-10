import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const CustomVideoPlayer({super.key, required this.videoUrl});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  // video controller
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..addListener(() {
        if (_controller.value.isInitialized && !_isInitialized) {
          setState(() {
            _isInitialized = true;
          });
        }
      })
      ..setLooping(false)
      ..initialize().then((_) {
        _controller.play();
        setState(() {
          _isPlaying = true;
        });
      }).catchError((error) {
        print("Error: $error");
      });
  }

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  // play and pause video
  void _playPauseVideo() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _isInitialized
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(
                    VideoPlayerController.networkUrl(Uri.parse(
                        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),

          // play and pause button
          Positioned(
            child: IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: _playPauseVideo,
            ),
          ),
        ],
      ),
    );
  }
}
