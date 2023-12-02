import 'package:flutter/material.dart';
import 'package:mynote/constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.text,
    required this.disabled,
    required this.onTap,
  });

  final String text;
  final bool disabled;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size16,
          ),
          decoration: BoxDecoration(
            color: disabled
                ? Colors.grey.shade400
                : Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                Sizes.size4,
              ),
            ),
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(
              milliseconds: 200,
            ),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
              color: disabled ? Colors.grey.shade500 : Colors.white,
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
