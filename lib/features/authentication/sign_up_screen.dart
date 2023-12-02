import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynote/constants/gaps.dart';
import 'package:mynote/constants/sizes.dart';
import 'package:mynote/features/authentication/login_screen.dart';
import 'package:mynote/features/authentication/username_screen.dart';
import 'package:mynote/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTab(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (builder) => const UserNameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            children: [
              Gaps.v60,
              const Text(
                "Sign up to MyNote",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
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
                onTap: () => onEmailTap(context),
              ),
              Gaps.v16,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.apple),
                text: "Continue with apple",
                onTap: () => onEmailTap(context),
              ),
              Gaps.v16,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.google),
                text: "Continue with google",
                onTap: () => onEmailTap(context),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        color: Colors.grey.shade50,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Already have an account?"),
          Gaps.h5,
          GestureDetector(
            onTap: () => _onLoginTab(context),
            child: Text(
              "Log in",
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
