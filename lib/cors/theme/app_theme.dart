import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardHeader, // Matches BottomAppBar color (0xFFF3F7EE)
      selectedItemColor: AppColors.buttonColor, // 0xFF299C46 for selected items
      unselectedItemColor: AppColors.grey, // Grey for unselected items
      showUnselectedLabels: true, // Show labels for consistency with ParentScreen
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyles.bottomNavSelected,
      unselectedLabelStyle: AppTextStyles.bottomNavUnselected,
    ),
    textTheme: AppTextStyles.textTheme,
  );
}