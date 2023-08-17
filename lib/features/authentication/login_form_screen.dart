import 'package:douyin_clone/constants/gaps.dart';
import 'package:douyin_clone/constants/sizes.dart';
import 'package:douyin_clone/features/authentication/widgets/form_button.dart';
import 'package:douyin_clone/features/onboarding/interests_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _onsubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.goNamed(InterestsScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'please write ur email';
                  }
                  return null;
                },
                onSaved: (newValue) {},
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'please write ur email';
                  }
                  return null;
                },
                onSaved: (newValue) {},
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onsubmitTap,
                child: const FormButton(
                  disabled: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
