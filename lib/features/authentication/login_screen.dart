import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/login_form_screen.dart';
import 'package:mynote/features/authentication/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTab(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    void _onEmailLoginTap() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => const LoginFormScreen(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            children: [
              Gaps.v60,
              const Text(
                "Log in to MyNote",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v10,
              const Text(
                "ekdl fdsl fjs fsdlf sdlf slf sdl fslf ssfjsldfj asdak fdd sf sdf sdf sdf sdfsdf ",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.user),
                text: "Use email & password",
                onTap: _onEmailLoginTap,
              ),
              Gaps.v16,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
                onTap: () {},
              ),
              Gaps.v16,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.google),
                text: "Continue with Google",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.grey.shade100,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Don't have an account?"),
          Gaps.h5,
          GestureDetector(
            onTap: () => onSignUpTab(context),
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ]),
      ),
    );
  }
}
