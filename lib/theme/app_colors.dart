import 'package:flutter/material.dart';

abstract class AppColors {
  // Основные цвета (ваши существующие + новые)
  static const Color primary = Color.fromARGB(255, 213, 27, 17); // Ваш красный
  static const Color secondary = Color(0xFF5856D6); // Фиолетовый
  static const Color accent = Color(0xFF34C759); // Зеленый
  
  // Фоновые цвета
  static const Color background = Color(0xFFF2F2F7);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFFF3B30);
  
  // Текстовые цвета
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textDisabled = Color(0xFFC7C7CC);
  
  // Навигация
  static const Color navigationBar = Color(0xFFFFFFFF);
  static const Color navigationSelected = Color.fromARGB(255, 213, 27, 17);
  static const Color navigationUnselected = Colors.grey;
  
  // Дополнительные цвета
  static const Color divider = Color(0xFFC6C6C8);
  static const Color shadow = Color(0x33000000);
}

abstract class AppDarkColors {
  // Основные цвета для темной темы
  static const Color primary = Color.fromARGB(255, 233, 67, 57); // Более светлый красный
  static const Color secondary = Color(0xFF5E5CE6);
  static const Color accent = Color(0xFF30D158);
  
  // Фоновые цвета для темной темы
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF1C1C1E);
  static const Color error = Color(0xFFFF453A);
  
  // Текстовые цвета для темной темы
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textDisabled = Color(0xFF48484A);
  
  // Навигация для темной темы
  static const Color navigationBar = Color(0xFF1C1C1E);
  static const Color navigationSelected = Color.fromARGB(255, 233, 67, 57);
  static const Color navigationUnselected = Color(0xFF8E8E93);
  
  // Дополнительные цвета для темной темы
  static const Color divider = Color(0xFF38383A);
  static const Color shadow = Color(0x00000000);
}