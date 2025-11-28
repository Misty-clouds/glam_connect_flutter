import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/index.dart';

class EnterOTP extends StatefulWidget {
  const EnterOTP({super.key});

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  final _otpController = TextEditingController();
  int _remainingSeconds = 17;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _remainingSeconds = 17;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
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
          'Enter OTP',
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
                'Enter the code we just sent to your email',
                style: AppTextStyles.body1(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
              ),
              const SizedBox(height: 32),
              
              // Enter OTP
              Text(
                'Enter OTP',
                style: AppTextStyles.body1(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.mediumText,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
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
                  counterText: '',
                ),
                style: AppTextStyles.body1(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.regularText,
                ),
              ),
              const SizedBox(height: 16),
              
              // Resend code
              Row(
                children: [
                  Text(
                    'I can\'t see the code ',
                    style: AppTextStyles.body1(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                  TextButton(
                    onPressed: _remainingSeconds == 0 ? _resendCode : null,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      _remainingSeconds > 0 ? 'Resend (${_remainingSeconds}s)' : 'Resend',
                      style: AppTextStyles.body1(
                        color: _remainingSeconds > 0 ? AppColors.grey2 : AppColors.textColor1,
                        weight: AppTextStyles.mediumText,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              
              // Continue button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/reset-password/new-password');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Continue',
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
