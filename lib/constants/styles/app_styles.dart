import 'package:flutter/material.dart';
import 'package:glam_connect/constants/enum.dart';
import 'package:glam_connect/constants/styles/app_colors.dart';


class AppStyles {
  AppStyles._();

    //button style
  static ButtonStyle buttonStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    double? width,
    double? height,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ??AppColors.orange,
      foregroundColor: foregroundColor ?? AppColors.textColor,
      minimumSize: Size(width ?? 358, height ?? 48),
      maximumSize: const Size(480, 48),
      padding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  //toggle switch style
  static SwitchThemeData toggleSwitchStyle() {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.orange;
        }
        return Colors.grey.shade300;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );
  }

  //snackbar styles
  static SnackBar successSnackBar(String message) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.green, fontSize: 16),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFE8F5E9),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
    );
  }

  static SnackBar warningSnackBar(String message) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.priority_high, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.orange, fontSize: 16),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFF3E0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
    );
  }

  static SnackBar errorSnackBar(String message) {
    return SnackBar(
      content: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.delete_outline, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFEBEE),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
    );
  }

  //status badge styles
  static Widget statusBadge(String text, {required StatusType type}) {
    Color backgroundColor;
    Color textColor;
    Color dotColor;

    switch (type) {
      case StatusType.active:
        backgroundColor = const Color(0xFFE8F5E9);
        textColor = Colors.green;
        dotColor = Colors.green;
        break;
      case StatusType.canceled:
        backgroundColor = const Color(0xFFFFEBEE);
        textColor = Colors.red;
        dotColor = Colors.red;
        break;
      case StatusType.pending:
        backgroundColor = const Color(0xFFFFF3E0);
        textColor = Colors.orange;
        dotColor = Colors.orange;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

}

