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
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: Colors.white,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
