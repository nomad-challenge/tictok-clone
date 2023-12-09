import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';

import '../../constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All activity"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            child: Text("New"),
          ),
          Gaps.v14,
          Dismissible(
            key: const Key("x"),
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: const Padding(
                padding: EdgeInsets.only(
                  left: Sizes.size10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.checkDouble,
                  color: Colors.white,
                  size: Sizes.size32,
                ),
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.only(
                  right: Sizes.size10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.white,
                  size: Sizes.size32,
                ),
              ),
            ),
            child: ListTile(
              leading: Container(
                width: Sizes.size52,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: Sizes.size1,
                  ),
                ),
                child: const Center(
                  child: FaIcon(FontAwesomeIcons.bell),
                ),
              ),
              title: RichText(
                text: TextSpan(
                  text: "Account updates:",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                  children: [
                    const TextSpan(
                      text: " Upload longer videos",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: " 1h",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size14,
                color: Colors.grey.shade600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
