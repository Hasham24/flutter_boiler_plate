import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Base controller class that provides common functionality for all controllers
abstract class BaseController extends GetxController {
  // Loading state management
  final RxBool _isLoading = false.obs;
  final RxBool _isButtonLoading = false.obs;
  final RxString errorMessage = ''.obs;

  /// Getter for loading state
  bool get isLoading => _isLoading.value;
  bool get isButtonLoading => _isButtonLoading.value;

  /// Set loading state
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  void setButtonLoading(bool loading) {
    _isButtonLoading.value = loading;
  }

  /// Toggle loading state
  void toggleLoading() {
    _isLoading.value = !_isLoading.value;
  }

  /// Show loading and execute async operation
  Future<T?> executeWithLoading<T>(Future<T> Function() operation) async {
    setLoading(true);
    try {
      final result = await operation();
      return result;
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }

  /// Show loading with custom message
  void showLoading([String? message]) {
    setLoading(true);
    if (message != null) {
      Get.dialog(
        AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              16.horizontalSpace,
              Text(message),
            ],
          ),
        ),
        barrierDismissible: false,
      );
    }
  }

  /// Hide loading
  void hideLoading() {
    setLoading(false);
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  /// Show success message
  void showSuccess(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.primaryColor,
      colorText: Get.theme.colorScheme.onPrimary,
    );
  }

  /// Show error message
  void showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
    );
  }

  /// Show info message
  void showInfo(String message) {
    Get.snackbar('Info', message, snackPosition: SnackPosition.BOTTOM);
  }

  /// Navigate to route
  void navigateTo(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  /// Navigate and clear previous routes
  void navigateAndClear(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  /// Go back
  void goBack({dynamic result}) {
    Get.back(result: result);
  }

  @override
  void onClose() {
    // Clean up loading state
    setLoading(false);
    super.onClose();
  }
}
