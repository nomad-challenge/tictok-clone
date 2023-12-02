import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;
  void _onPanUpdate(DragUpdateDetails detail) {
    if (detail.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails detail) {
    if (_direction == Direction.left) {
      _showingPage = Page.second;
    } else {
      _showingPage = Page.first;
    }
    setState(() {});
  }

  void _onPressed() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (builder) => const MainNavigationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: SafeArea(
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const Column(
                children: [
                  Gaps.v52,
                  Text(
                    "Watch cool Videos",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    "Videos are personalized for you based on what you watch, like and share.",
                    style: TextStyle(fontSize: Sizes.size20),
                  )
                ],
              ),
              secondChild: const Column(
                children: [
                  Gaps.v52,
                  Text(
                    "Fllow me",
                    style: TextStyle(
                      fontSize: Sizes.size36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    "Move move move",
                    style: TextStyle(fontSize: Sizes.size20),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size24),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.second ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: CupertinoButton(
                color: Theme.of(context).primaryColor,
                onPressed: _onPressed,
                child: const Text("Enter the app"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
