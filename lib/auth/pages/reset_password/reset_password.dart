import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/index.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Reset password',
          style: AppTextStyles.h4(
            color: AppColors.textColor1,
            weight: AppTextStyles.semiBoldText,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                'Enter the email address or phone number linked to your account. We\'ll send you a link or code to reset your password.',
                style: AppTextStyles.body1(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
              ),
              const SizedBox(height: 32),
              
              // Email address
              Text(
                'Email address',
                style: AppTextStyles.body1(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.mediumText,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'janedoe@gmail.com',
                  hintStyle: AppTextStyles.body1(
                    color: AppColors.grey2,
                    weight: AppTextStyles.regularText,
                  ),
                  filled: true,
                  fillColor: AppColors.grey3,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
                style: AppTextStyles.body1(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.regularText,
                ),
              ),
              const Spacer(),
              
              // Send code button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/reset-password/enter-otp');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Send code',
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
