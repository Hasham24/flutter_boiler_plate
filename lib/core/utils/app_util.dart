import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum ToastType { success, error }

class AppUtil {
  static bool isTestEnvironment = false;

  /// Check if the platform is iOS
  static bool isIOS() {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  /// Update status bar
  static void updateStatusBar() {
    // Implementation for status bar update
  }

  // --- Validators ---
  static bool isEmailValid(String value) {
    if (value.isEmpty) return false;
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(value);
  }

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!isEmailValid(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  /// Mask passcode to show first two characters and mask the rest with '*'.
  static String maskedPasscode(String passcode) {
    if (passcode.length <= 2) return passcode;
    final String visiblePrefix = passcode.substring(0, 2);
    final String maskedSuffix = List.filled(passcode.length - 2, '*').join();
    return visiblePrefix + maskedSuffix;
  }

  /// Show toast (Success/Error)
  /// context is optional because ToastificationWrapper allows no-context usage
  String formatTime(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return DateFormat.jm().format(dateTime); // e.g. 9:00 AM
    } catch (e) {
      return ''; // return empty if parsing fails
    }
  }

  String formatMonthYear(String date) {
    final parsedDate = DateTime.parse('$date-01'); // "2025-10" → "2025-10-01"
    return DateFormat('MMMM yyyy').format(parsedDate); // "October 2025"
  }

  String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  bool isExpired(String expiryDatetime) {
    final now = DateTime.now();
    final expiryDate = DateTime.parse(expiryDatetime);
    return now.isAfter(expiryDate);
  }
}
