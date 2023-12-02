import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/videos/widgets/tags.dart';
import 'package:mynote/features/videos/widgets/video_button.dart';
import 'package:mynote/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/sample_movie.mp4");

  Duration animatedDuration = const Duration(milliseconds: 200);
  bool isPaused = false;
  late AnimationController _animationController;

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlay() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChanged);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlay();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: animatedDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _onCommentsTap() async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: isPaused ? 1 : 0,
                    duration: animatedDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size52,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: Sizes.size20,
            left: Sizes.size20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@anderson",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  "This is my house in Thailand!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v4,
                Tags(
                  text: [
                    "googlearth",
                    "googlemaps",
                    "dfsdfsdf",
                    "dfsdfsdf",
                    "dfsdfsdf",
                    "dfsdfsdf",
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: Sizes.size20,
              right: Sizes.size20,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: Sizes.size24,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/16436404?s=40&v=4"),
                    child: Text(
                      "MIN",
                    ),
                  ),
                  Gaps.v24,
                  const VideoButton(
                    icon: FontAwesomeIcons.solidHeart,
                    text: "2.9M",
                  ),
                  Gaps.v24,
                  GestureDetector(
                    onTap: _onCommentsTap,
                    child: const VideoButton(
                      icon: FontAwesomeIcons.solidComment,
                      text: "33k",
                    ),
                  ),
                  Gaps.v24,
                  const VideoButton(
                    icon: FontAwesomeIcons.share,
                    text: "Share",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
