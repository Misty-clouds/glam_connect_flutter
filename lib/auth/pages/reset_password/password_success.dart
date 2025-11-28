import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/index.dart';

class PasswordUpdateSuccess extends StatelessWidget {
  const PasswordUpdateSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Success icon
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.check,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              
              // Success title
              Text(
                'Password updated',
                style: AppTextStyles.h3(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.boldText,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              // Success message
              Text(
                'You can now login with your new password',
                style: AppTextStyles.body1(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              
              // Go to login button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Go to login',
                    style: AppTextStyles.body1(
                      color: Colors.white,
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
