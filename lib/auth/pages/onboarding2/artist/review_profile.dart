import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistReviewProfile extends StatelessWidget {
  const ArtistReviewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
          onPressed: () => Navigator.pop(context),
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
      body: Column(
        children: [
          Text(
            'Review Your Profile',
            style: AppTextStyles.h4(
              color: AppColors.textColor1,
              weight: AppTextStyles.boldText,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Please review all information before submitting for approval',
                      style: AppTextStyles.caption1(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Basic information
                  _buildSectionHeader('Basic information', onEdit: () {}),
                  const SizedBox(height: 12),
                  _buildInfoRow('Name', 'Sarah Abdul'),
                  _buildInfoRow('Phone number', '+977 35678 3789'),
                  _buildInfoRow(
                    'Location',
                    '1. Riyadh (Northern Riyadh, Western Riyadh)\n2. Dubai (Dubai Marina)',
                  ),
                  const SizedBox(height: 24),
                  // Services offered
                  _buildSectionHeader('Services offered', onEdit: () {}),
                  const SizedBox(height: 12),
                  ...[1, 2, 3]
                      .map(
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('🎊', style: TextStyle(fontSize: 20)),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Event Makeup',
                                      style: AppTextStyles.body2(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'SAR 800 • 2.5 hours',
                                      style: AppTextStyles.caption1(
                                        color: AppColors.grey2,
                                        weight: AppTextStyles.regularText,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.image_outlined,
                                          size: 14,
                                          color: AppColors.grey2,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '2 portfolio photos',
                                          style: AppTextStyles.caption2(
                                            color: AppColors.grey2,
                                            weight: AppTextStyles.regularText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 24),
                  // Availability
                  _buildSectionHeader('Availability', onEdit: () {}),
                  const SizedBox(height: 12),
                  _buildInfoRow('Monday - Thursday', '9:00 AM - 8:00 PM'),
                  _buildInfoRow('Friday', '9:00 AM - 8:00 PM'),
                  _buildInfoRow('Saturday', '9:00 AM - 8:00 PM'),
                  _buildInfoRow('Sunday', 'Closed'),
                  const SizedBox(height: 24),
                  // Work certificate
                  _buildSectionHeader('Work certificate', onEdit: () {}),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.error1.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Text(
                              'PDF',
                              style: AppTextStyles.caption2(
                                color: AppColors.error1,
                                weight: AppTextStyles.boldText,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Report name_T3.pdf',
                                style: AppTextStyles.body2(
                                  color: AppColors.textColor1,
                                  weight: AppTextStyles.regularText,
                                ),
                              ),
                              Text(
                                '23.5MB • 100% • Uploaded Successfully',
                                style: AppTextStyles.caption2(
                                  color: AppColors.success1,
                                  weight: AppTextStyles.regularText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline,
                            color: AppColors.error1,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Total Portfolio Photos
                  Text(
                    'Total Portfolio Photos: 10',
                    style: AppTextStyles.body1(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.semiBoldText,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: AppColors.grey5,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/role1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Submit for approval
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: false,
                    enableDrag: false,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.grey4,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: const BoxDecoration(
                                      color: AppColors.orange,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.access_time,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    'Under review',
                                    style: AppTextStyles.h4(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.boldText,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Your artist profile has been submitted for review.\nOur team will verify your information and portfolio,\nyou will be notified of the outcome',
                                    style: AppTextStyles.body2(
                                      color: AppColors.grey2,
                                      weight: AppTextStyles.regularText,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.access_time_outlined,
                                        color: AppColors.grey2,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Estimated review time: 24-48 hours',
                                        style: AppTextStyles.body2(
                                          color: AppColors.grey2,
                                          weight: AppTextStyles.regularText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context.go('/artist/home');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.orange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  'Go To Dashboard',
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

  Widget _buildSectionHeader(String title, {required VoidCallback onEdit}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.body1(
            color: AppColors.textColor1,
            weight: AppTextStyles.semiBoldText,
          ),
        ),
        TextButton.icon(
          onPressed: onEdit,
          icon: const Icon(
            Icons.edit_outlined,
            color: AppColors.orange,
            size: 16,
          ),
          label: Text(
            'Edit',
            style: AppTextStyles.body2(
              color: AppColors.orange,
              weight: AppTextStyles.mediumText,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.caption1(
              color: AppColors.textColor1,
              weight: AppTextStyles.semiBoldText,
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
    );
  }
}
