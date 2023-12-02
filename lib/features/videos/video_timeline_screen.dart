import 'package:flutter/material.dart';
import 'package:mynote/features/videos/widgets/video_post.dart';

class VideoTimelineScren extends StatefulWidget {
  const VideoTimelineScren({super.key});

  @override
  State<VideoTimelineScren> createState() => _VideoTimelineScrenState();
}

class _VideoTimelineScrenState extends State<VideoTimelineScren> {
  final PageController _pageController = PageController();
  final Duration _duration = const Duration(milliseconds: 250);
  final Curve _curve = Curves.linear;
  int _itemCount = 4;
  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _duration,
      curve: _curve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    _pageController.nextPage(
      duration: _duration,
      curve: _curve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    return Future.delayed(const Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      displacement: 50,
      edgeOffset: 20,
      color: Theme.of(context).primaryColor,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index),
      ),
    );
  }
}
