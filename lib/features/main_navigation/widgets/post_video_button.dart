import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/sizes.dart';

class PostVidewButton extends StatelessWidget {
  const PostVidewButton({super.key, required this.isInverted});

  final bool isInverted;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.size8)),
            ),
            height: 30,
            width: 25,
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.size8)),
            ),
            height: 30,
            width: 25,
          ),
        ),
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
          decoration: BoxDecoration(
            color: isInverted ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(
              Sizes.size8,
            ),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: Sizes.size20,
              color: isInverted ? Colors.black : Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
