import 'package:flutter/material.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/email_screen.dart';
import 'package:mynote/features/authentication/widgets/form_button.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";
  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_username.isEmpty) {
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => const EmailScreen(),
      ),
    );
  }

  void _onScafoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScafoldTap,
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
                "Create username",
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
                controller: _usernameController,
                onEditingComplete: _onNextTap,
                decoration: const InputDecoration(
                  hintText: "Username",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
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
                disabled: _username.isEmpty ? true : false,
                onTap: _onNextTap,
              )
            ],
          ),
        ),
      ),
    );
  }
}
