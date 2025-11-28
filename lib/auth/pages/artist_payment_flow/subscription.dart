import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/styles/app_colors.dart';
import '../../../constants/styles/text_style.dart';

class ArtistSubscription extends StatefulWidget {
  const ArtistSubscription({super.key});

  @override
  State<ArtistSubscription> createState() => _ArtistSubscriptionState();
}

class _ArtistSubscriptionState extends State<ArtistSubscription> {
  String? selectedPlan;

  final List<Map<String, dynamic>> plans = [
    {
      'duration': '3 months',
      'price': 450,
      'monthlyPrice': 150,
      'savings': 10,
    },
    {
      'duration': '6 months',
      'price': 450,
      'monthlyPrice': 150,
      'savings': 10,
    },
    {
      'duration': '12 months',
      'price': 450,
      'monthlyPrice': 150,
      'savings': 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Title
            Text(
              'Subscription',
              style: AppTextStyles.h4(
                color: AppColors.plum,
                weight: AppTextStyles.boldText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Subtitle
            Text(
              'Choose your plan',
              style: AppTextStyles.body1(
                color: AppColors.grey2,
                weight: AppTextStyles.regularText,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Plans
            Expanded(
              child: ListView.separated(
                itemCount: plans.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final plan = plans[index];
                  final isSelected = selectedPlan == plan['duration'];
                  
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlan = plan['duration'];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? AppColors.orange : Colors.transparent,
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
                          const SizedBox(width: 16),
                          // Plan details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SAR ${plan['price']}',
                                  style: AppTextStyles.h5(
                                    color: AppColors.plum,
                                    weight: AppTextStyles.boldText,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'SAR ${plan['monthlyPrice']}/month (Save ${plan['savings']}%)',
                                  style: AppTextStyles.caption1(
                                    color: AppColors.grey2,
                                    weight: AppTextStyles.regularText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Duration
                          Text(
                            plan['duration'],
                            style: AppTextStyles.body2(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: selectedPlan != null
                    ? () {
                        context.push('/artist/subscription/review');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  disabledBackgroundColor: AppColors.grey4,
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
          ],
        ),
      ),
    );
  }
}