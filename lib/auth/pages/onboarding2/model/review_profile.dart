import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/index.dart';

class ModelReviewProfile extends StatelessWidget {
  const ModelReviewProfile({super.key});

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 7/7',
                style: AppTextStyles.body2(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Review Your Profile',
                        style: AppTextStyles.h5(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.boldText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Please review all information before submitting for approval',
                        style: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Basic information section
                    _buildSectionHeader('Basic information', () {
                      context.go('/model/onboarding/create-profile');
                    }),
                    const SizedBox(height: 16),
                    _buildInfoRow('Name', 'Sarah Abdul'),
                    _buildInfoRow('Phone number', '+977 35678 3789'),
                    _buildInfoRow('Date of birth', '27 Dec, 2002'),
                    _buildInfoRow('Location', '123 Jacob street, Dubai Marina'),
                    const SizedBox(height: 32),
                    
                    // Experience and interest section
                    _buildSectionHeader('Experience and interest', () {
                      context.go('/model/onboarding/experience-interest');
                    }),
                    const SizedBox(height: 16),
                    _buildInfoRow('Experience', 'Some experience'),
                    _buildInfoRow('Interested in', 'Bridal, bridal, Glamorous'),
                    _buildInfoRow('Bio', 'I am passionate'),
                    const SizedBox(height: 32),
                    
                    // Portfolio photos section
                    _buildSectionHeader('Total Portfolio Photos: 10', () {
                      context.go('/model/onboarding/showcase');
                    }),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.grey3,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Physical details section
                    _buildSectionHeader('Physical details', () {
                      context.go('/model/onboarding/physical-details');
                    }),
                    const SizedBox(height: 16),
                    _buildInfoRow('Height', '165 cm (5\'5")'),
                    _buildInfoRow('Skin tone', 'Medium'),
                    _buildInfoRow('Hair', 'Black'),
                    _buildInfoRow('Eyes', 'Brown'),
                  ],
                ),
              ),
            ),
            
            // Submit button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/model/onboarding/under-review');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Submit for approval',
                    style: AppTextStyles.body1(
                      color: Colors.white,
                      weight: AppTextStyles.semiBoldText,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onEdit) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.body1(
              color: AppColors.textColor1,
              weight: AppTextStyles.semiBoldText,
            ),
          ),
          TextButton(
            onPressed: onEdit,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Row(
              children: [
                Text(
                  'Edit',
                  style: AppTextStyles.body2(
                    color: AppColors.orange,
                    weight: AppTextStyles.mediumText,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.edit_outlined,
                  color: AppColors.orange,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.body2(
                color: AppColors.textColor1,
                weight: AppTextStyles.mediumText,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: AppTextStyles.body2(
                color: AppColors.grey2,
                weight: AppTextStyles.regularText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
