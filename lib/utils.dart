import 'package:flutter/material.dart';

bool isDarkModel(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}
