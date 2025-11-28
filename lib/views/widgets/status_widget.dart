import 'package:flutter/material.dart';
import '../../constants/styles/app_colors.dart';
import '../../constants/styles/text_style.dart';

enum StatusType { pending, success, error }

class StatusWidget extends StatelessWidget {
  final StatusType type;
  final String title;
  final String message;
  final String? additionalInfo;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool showButton;

  const StatusWidget({
    super.key,
    required this.type,
    required this.title,
    required this.message,
    this.additionalInfo,
    required this.buttonText,
    required this.onButtonPressed,
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    IconData iconData;

    switch (type) {
      case StatusType.pending:
        iconColor = AppColors.warning1;
        iconData = Icons.access_time;
        break;
      case StatusType.success:
        iconColor = AppColors.success1;
        iconData = Icons.check;
        break;
      case StatusType.error:
        iconColor = AppColors.error1;
        iconData = Icons.error_outline;
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor,
                ),
                child: Icon(
                  iconData,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              // Title
              Text(
                title,
                style: AppTextStyles.h4(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.boldText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Message
              Text(
                message,
                style: AppTextStyles.body2(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
                textAlign: TextAlign.center,
              ),
              if (additionalInfo != null) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.access_time, size: 20, color: AppColors.grey2),
                    const SizedBox(width: 8),
                    Text(
                      additionalInfo!,
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ],
                ),
              ],
              const Spacer(),
              // Button
              if (showButton)
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      buttonText,
                      style: AppTextStyles.body1(
                        color: AppColors.textColor,
                        weight: AppTextStyles.semiBoldText,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
