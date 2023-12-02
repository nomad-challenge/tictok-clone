import 'package:flutter/material.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/password_screen.dart';
import 'package:mynote/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  String _email = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) {
      return null;
    }
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void __onScafoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => const PasswordScreen(),
      ),
    );
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
                "What is your email?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v6,
              const Text(
                "You can always change username",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid(),
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
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              FormButton(
                text: "Next",
                disabled: _email.isEmpty || _isEmailValid() != null,
                onTap: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
