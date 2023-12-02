import 'package:flutter/material.dart';
import 'package:mynote/constants/sizes.dart';

class Tags extends StatefulWidget {
  final List<String> text;

  const Tags({
    super.key,
    required this.text,
  });

  @override
  State<Tags> createState() => _TagState();
}

class _TagState extends State<Tags> {
  bool isAllView = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > 2) {
      isAllView = false;
    }
  }

  void _onTap() {
    isAllView = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          !isAllView
              ? "#${widget.text.getRange(0, 2).join(" #")}"
              : "#${widget.text.join(" #")}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size16,
          ),
        ),
        GestureDetector(
          onTap: _onTap,
          child: Text(
            !isAllView ? "...See more" : "",
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size16),
          ),
        )
      ],
    );
  }
}
