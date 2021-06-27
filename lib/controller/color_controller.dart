import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../import/utils.dart';

class ColorController extends GetxController {
  Color get main => (isLightMode) ? (Color(0xFFF4F4F4)) : (Color(0xFF1A172F));
  Color get contrast =>
      (isLightMode) ? (Color(0xFFF4F4F4)) : (Color(0xFF1A172F));

  Color get style => Color(0xFFA463F5);
  Color get alternative => Color(0xFF00A3FF);

  Color get defaultMain => Color(0xFFF4F4F4);
  Color get defaultContrast => Color(0xFF1A172F);
  Color get white => Colors.white;
  Color get black => Colors.black;

  RxBool _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;
  bool get isLightMode => !(_isDarkMode.value);

  void themeSwitcher(ThemeSwitchMode mode) {
    if (mode == ThemeSwitchMode.light) {
      if (isDarkMode) {
        _isDarkMode.value = !_isDarkMode.value;
      }
    } else if (mode == ThemeSwitchMode.dark) {
      if (isLightMode) {
        _isDarkMode.value = !_isDarkMode.value;
      }
    } else {
      _isDarkMode.value = !_isDarkMode.value;
    }
  }

  T chooser<T>({required T lightMode, required T darkMode}) {
    if (isLightMode) {
      return lightMode;
    } else {
      return darkMode;
    }
  }
}
