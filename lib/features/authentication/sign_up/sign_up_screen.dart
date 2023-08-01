import 'package:douyin_clone/constants/gaps.dart';
import 'package:douyin_clone/constants/sizes.dart';
import 'package:douyin_clone/features/authentication/login/login_screen.dart';
import 'package:douyin_clone/features/authentication/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                'Sign up for Tiktok',
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w700),
              ),
              Gaps.v20,
              Text(
                'Create a profile, follow other accounts, make your own videos, and mote.',
                style: TextStyle(fontSize: Sizes.size16, color: Colors.black45),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.user),
                text: "Use email & password",
              ),
              Gaps.v16,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey.shade100,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                Gaps.h5,
                GestureDetector(
                  onTap: () => onLoginTap(context),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
