import 'package:flutter/material.dart';
import 'package:mynote/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
  });

  final String interest;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool isSelected = false;
  void onTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.size32),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
            )
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}
