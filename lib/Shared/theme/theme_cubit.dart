import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  static const String _themeKey = 'theme_mode';

  Future<void> _loadTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(_themeKey) ?? false;
      emit(isDark ? ThemeMode.dark : ThemeMode.light);
    } catch (e) {
      emit(ThemeMode.light);
    }
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newMode);
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, newMode == ThemeMode.dark);
    } catch (e) {
      // Handle error silently
    }
  }

  bool get isDarkMode => state == ThemeMode.dark;
}
