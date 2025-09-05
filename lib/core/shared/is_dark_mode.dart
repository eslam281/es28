import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension DarkMode on BuildContext{
  bool get isDark => ThemeMode ==ThemeMode.dark;
}