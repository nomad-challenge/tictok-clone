import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/birthday_screen.dart';
import 'package:mynote/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final regExpLength = RegExp(r"^(?=.{8,20}$).*");
  final regExpAlpahNumber = RegExp(r"(?=.*[0-9])(?=.*[a-zA-Z])");
  final regExpSpecialChar = RegExp(r"(?=.*[@$!%*#?&\^])");

  String _password = "";
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordLengthValid() {
    return regExpLength.hasMatch(_password);
  }

  bool _isPasswordAlpahNumberValid() {
    return regExpAlpahNumber.hasMatch(_password);
  }

  bool _isPasswordASpecialCharValid() {
    return regExpSpecialChar.hasMatch(_password);
  }

  void __onScafoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_password.isEmpty ||
        !_isPasswordLengthValid() ||
        !_isPasswordAlpahNumberValid() ||
        !_isPasswordASpecialCharValid()) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => const BirthdayScreen(),
      ),
    );
  }

  void _onCrearPassword() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: __onScafoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sign up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v6,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: "Make is strong!",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onCrearPassword,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      ),
                      Gaps.h16,
                      GestureDetector(
                        onTap: _toggleObscureText,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          color: Colors.grey.shade400,
                          size: Sizes.size20,
                        ),
                      )
                    ],
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordLengthValid()
                        ? Colors.green
                        : Colors.grey.shade500,
                  ),
                  Gaps.h8,
                  const Text("8 to 20 characters")
                ],
              ),
              Gaps.v6,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordAlpahNumberValid()
                        ? Colors.green
                        : Colors.grey.shade500,
                  ),
                  Gaps.h8,
                  const Text("Letters and numbers")
                ],
              ),
              Gaps.v6,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordASpecialCharValid()
                        ? Colors.green
                        : Colors.grey.shade500,
                  ),
                  Gaps.h8,
                  const Text("Special Characters")
                ],
              ),
              Gaps.v28,
              FormButton(
                text: "Next",
                disabled: !_isPasswordLengthValid() ||
                    !_isPasswordAlpahNumberValid() ||
                    !_isPasswordASpecialCharValid(),
                onTap: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
