import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Text(
        (error as FirebaseException).message ?? "Something wen't wrong.",
      ),
    ),
  );
}
