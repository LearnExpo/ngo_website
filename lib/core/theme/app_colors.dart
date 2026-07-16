import 'package:flutter/material.dart';

/// Centralized color palette for the NGO website.
/// Warm / humanitarian direction: terracotta + red-orange + amber accents
/// on a warm off-white background.
class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFFE85D2C); // Terracotta
  static const Color primaryDark = Color(0xFFC44A1F);
  static const Color primaryLight = Color(0xFFF3A57C);

  static const Color secondary = Color(0xFFD64545); // Warm red-orange (CTAs)
  static const Color secondaryDark = Color(0xFFB53535);

  static const Color accent = Color(0xFFF2A65A); // Soft gold / amber

  // Neutrals
  static const Color background = Color(0xFFFDF8F3); // Warm off-white
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFF6ECE3);

  static const Color textPrimary = Color(0xFF2B2420); // Charcoal
  static const Color textSecondary = Color(0xFF6B5F56);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static const Color divider = Color(0xFFE7DCD0);

  // Status
  static const Color success = Color(0xFF3E9B4F);
  static const Color error = Color(0xFFC62828);

  // Gradients (used for hero sections)
  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );
}
