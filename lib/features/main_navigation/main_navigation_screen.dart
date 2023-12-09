import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/discover/discover_screen.dart';
import 'package:mynote/features/inbox/inbox_screen.dart';
import 'package:mynote/features/main_navigation/widgets/nav_tab.dart';
import 'package:mynote/features/main_navigation/widgets/post_video_button.dart';
import 'package:mynote/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 3;
  var screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Discover"),
    ),
    const Center(
      child: Text("test"),
    ),
    const Center(
      child: Text("Inbox"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  void _onTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => Scaffold(
          appBar: AppBar(
            title: const Text("post video"),
          ),
          body: Container(),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: const VideoTimelineScren(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: DiscoverScreen(goBack: _onTap),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const Center(
                child: Text("button"),
              ),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const InboxScreen(),
            ),
            Offstage(
              offstage: _selectedIndex != 4,
              child: const Center(
                child: Text("Profile"),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: _selectedIndex == 0 ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavTab(
                  text: "Home",
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  isSelected: _selectedIndex == 0,
                  onTap: () => _onTap(0),
                  isInverted: _selectedIndex == 0,
                ),
                NavTab(
                  text: "Discover",
                  icon: FontAwesomeIcons.compass,
                  selectedIcon: FontAwesomeIcons.solidCompass,
                  isSelected: _selectedIndex == 1,
                  onTap: () => _onTap(1),
                  isInverted: _selectedIndex == 0,
                ),
                Gaps.h24,
                GestureDetector(
                  onTap: _onPostVideoButtonTap,
                  child: PostVidewButton(
                    isInverted: _selectedIndex == 0,
                  ),
                ),
                Gaps.h24,
                NavTab(
                  text: "Inbox",
                  icon: FontAwesomeIcons.message,
                  selectedIcon: FontAwesomeIcons.solidMessage,
                  isSelected: _selectedIndex == 3,
                  onTap: () => _onTap(3),
                  isInverted: _selectedIndex == 0,
                ),
                NavTab(
                  text: "Profile",
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  isSelected: _selectedIndex == 4,
                  onTap: () => _onTap(4),
                  isInverted: _selectedIndex == 0,
                ),
              ],
            ),
          ),
        ));
  }
}
