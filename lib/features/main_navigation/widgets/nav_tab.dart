import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
    required this.isInverted,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final bool isInverted;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: isInverted ? Colors.black : Colors.white,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: isInverted ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                      color: isInverted ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
