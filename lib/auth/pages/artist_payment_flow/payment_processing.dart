import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentProcessing extends StatefulWidget {
  const PaymentProcessing({super.key});

  @override
  State<PaymentProcessing> createState() => _PaymentProcessingState();
}

class _PaymentProcessingState extends State<PaymentProcessing> {
  bool _isProcessing = true;
  
  @override
  void initState() {
    super.initState();
    // Simulate payment processing
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // Simulate success or error (90% success rate)
        final isSuccess = DateTime.now().millisecond % 10 != 0;
        
        if (isSuccess) {
          // Show success state briefly before navigating
          setState(() {
            _isProcessing = false;
          });
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (mounted) {
              context.pushReplacement('/artist/onboarding/create-profile');
            }
          });
        } else {
          // Navigate to error page
          context.pushReplacement('/artist/subscription/error');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Loading indicator or success icon
              if (_isProcessing)
                const SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD95909)),
                  ),
                )
              else
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              const SizedBox(height: 32),
              // Processing or success text
              Text(
                _isProcessing ? 'Processing payment' : 'Payment successful!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _isProcessing 
                    ? 'This will only take a moment' 
                    : 'Redirecting to onboarding...',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF616C7B),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
