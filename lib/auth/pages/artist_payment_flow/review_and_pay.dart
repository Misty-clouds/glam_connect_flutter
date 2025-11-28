import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/styles/app_colors.dart';
import '../../../constants/styles/text_style.dart';

class ReviewAndPay extends StatefulWidget {
  const ReviewAndPay({super.key});

  @override
  State<ReviewAndPay> createState() => _ReviewAndPayState();
}

class _ReviewAndPayState extends State<ReviewAndPay> {
  String? selectedPaymentMethod = 'mastercard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Review and pay',
          style: AppTextStyles.body1(
            color: AppColors.textColor1,
            weight: AppTextStyles.semiBoldText,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price details section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.beige,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price details',
                          style: AppTextStyles.body1(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.semiBoldText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildPriceRow(
                          'Subscription fee (3 months)',
                          'SAR 2,00.00',
                          isSubdued: true,
                        ),
                        const SizedBox(height: 12),
                        _buildPriceRow(
                          'Subtotal',
                          'SAR 1800.00',
                          isSubdued: true,
                        ),
                        const SizedBox(height: 16),
                        Divider(color: AppColors.grey4, thickness: 1),
                        const SizedBox(height: 16),
                        _buildPriceRow(
                          'Total',
                          'SAR 1800.00',
                          isTotal: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Payment method section
                  Text(
                    'Payment method',
                    style: AppTextStyles.body1(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.semiBoldText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Saved methods',
                    style: AppTextStyles.body2(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Saved cards
                  _buildPaymentOption(
                    id: 'mastercard',
                    icon: Icons.credit_card,
                    iconColor: Colors.red,
                    title: 'Mastercard',
                    subtitle: 'Credit card ending with ***56789',
                  ),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'visa',
                    icon: Icons.credit_card,
                    iconColor: Colors.blue,
                    title: 'Visa',
                    subtitle: 'Credit card ending with ***56789',
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Or',
                    style: AppTextStyles.body2(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Other payment options
                  _buildPaymentOption(
                    id: 'card',
                    icon: Icons.credit_card_outlined,
                    title: 'Credit/Debit card',
                    hasArrow: true,
                  ),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'stripe',
                    imagePath: 'stripe',
                    title: 'Stripe',
                  ),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'paypal',
                    imagePath: 'paypal',
                    title: 'Paypal',
                  ),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'googlepay',
                    imagePath: 'googlepay',
                    title: 'Google pay',
                  ),
                  const SizedBox(height: 12),
                  _buildPaymentOption(
                    id: 'applepay',
                    imagePath: 'applepay',
                    title: 'Apple pay',
                  ),
                ],
              ),
            ),
          ),
          // Continue button
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  _showPaymentProcessingBottomSheet(context);
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
                    color: AppColors.textColor,
                    weight: AppTextStyles.semiBoldText,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String amount, {bool isSubdued = false, bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.body1(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.semiBoldText,
                )
              : AppTextStyles.body2(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
        ),
        Text(
          amount,
          style: isTotal
              ? AppTextStyles.body1(
                  color: AppColors.plum,
                  weight: AppTextStyles.semiBoldText,
                )
              : AppTextStyles.body2(
                  color: AppColors.textColor1,
                  weight: AppTextStyles.mediumText,
                ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required String id,
    IconData? icon,
    Color? iconColor,
    String? imagePath,
    required String title,
    String? subtitle,
    bool hasArrow = false,
  }) {
    final isSelected = selectedPaymentMethod == id;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.orange : AppColors.grey4,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Radio button
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.orange : AppColors.grey3,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orange,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            // Icon or Image
            if (icon != null)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor?.withOpacity(0.1) ?? AppColors.grey5,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor ?? AppColors.grey2, size: 24),
              )
            else if (imagePath != null)
              Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.grey5,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.payment, color: AppColors.grey2),
              ),
            const SizedBox(width: 12),
            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.caption1(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Arrow
            if (hasArrow)
              const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey2),
          ],
        ),
      ),
    );
  }

  void _showPaymentProcessingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _PaymentProcessingBottomSheet();
      },
    );
  }
}

class _PaymentProcessingBottomSheet extends StatefulWidget {
  @override
  State<_PaymentProcessingBottomSheet> createState() => _PaymentProcessingBottomSheetState();
}

class _PaymentProcessingBottomSheetState extends State<_PaymentProcessingBottomSheet> {
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
              Navigator.pop(context); // Close bottom sheet
              context.go('/artist/onboarding/create-profile');
            }
          });
        } else {
          // Navigate to error page
          Navigator.pop(context); // Close bottom sheet
          context.pushReplacement('/artist/subscription/error');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
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
    );
  }
}
