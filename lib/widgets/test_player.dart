import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const SimpleVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
}

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      }).catchError((error) {
        debugPrint("Error initializing video: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error loading video: $error")),
        );
      });

    _controller.addListener(() {
      if (mounted) {
        setState(() {
          _isPlaying = _controller.value.isPlaying;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Format duration to mm:ss
  String _formatDuration(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(position.inMinutes.remainder(60));
    final seconds = twoDigits(position.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  /// Handle video seeking
  void _seekTo(double value) {
    final position = Duration(
        milliseconds:
            (value * _controller.value.duration.inMilliseconds).toInt());
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized
          ? Column(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                const SizedBox(height: 16),
                // Video Controls
                Column(
                  children: [
                    // Seek Bar
                    Slider(
                      value:
                          _controller.value.position.inMilliseconds.toDouble(),
                      max: _controller.value.duration.inMilliseconds.toDouble(),
                      onChanged: (value) {
                        _seekTo(value /
                            _controller.value.duration.inMilliseconds
                                .toDouble());
                      },
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                    ),
                    // Current Position / Total Duration
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(_controller.value.position)),
                          Text(_formatDuration(_controller.value.duration)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Play/Pause, Skip Forward, Skip Backward
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            final newPosition = _controller.value.position -
                                const Duration(seconds: 10);
                            _controller.seekTo(newPosition < Duration.zero
                                ? Duration.zero
                                : newPosition);
                          },
                          icon: const Icon(Icons.replay_10),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          icon:
                              Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                        ),
                        IconButton(
                          onPressed: () {
                            final newPosition = _controller.value.position +
                                const Duration(seconds: 10);
                            _controller.seekTo(
                              newPosition > _controller.value.duration
                                  ? _controller.value.duration
                                  : newPosition,
                            );
                          },
                          icon: const Icon(Icons.forward_10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
