import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:odinlab/constant/colors.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const CustomVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    // initialize the video player
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );

    // wait for the video player to initialize
    _videoPlayerController.initialize().then(
      (_) {
        setState(
          () {
            // initialize the chewie controller with video options
            _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController,
              autoPlay: false,
              looping: false,
              aspectRatio: _videoPlayerController.value.aspectRatio,
              // player ui
              materialProgressColors: ChewieProgressColors(
                playedColor: kSubMainColor,
                handleColor: kOrangeColor,
                backgroundColor: kDarkGreyColor,
                bufferedColor: kWhiteColor,
              ),
              errorBuilder: (context, errorMessage) {
                return Center(
                  child: Text(
                    'Error: $errorMessage',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : const CircularProgressIndicator(
                color: kSubMainColor,
                backgroundColor: kGreyColor,
              ),
      ),
    );
  }
}
