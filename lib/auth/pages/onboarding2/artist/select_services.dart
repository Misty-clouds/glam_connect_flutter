import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistSelectServices extends StatefulWidget {
  const ArtistSelectServices({super.key});

  @override
  State<ArtistSelectServices> createState() => _ArtistSelectServicesState();
}

class _ArtistSelectServicesState extends State<ArtistSelectServices> {
  final List<Map<String, dynamic>> services = [
    {
      'title': '💍 Bridal Makeup',
      'description': 'Traditional and modern bridal looks',
      'selected': false,
    },
    {
      'title': '🎊 Event Makeup',
      'description': 'Parties, galas, special occasions',
      'selected': false,
    },
    {
      'title': '👗 Fashion & Runway Makeup',
      'description': 'Fashion shows, runway, campaigns',
      'selected': false,
    },
    {
      'title': '💄 Editorial Makeup',
      'description': 'Magazine shoots, creative looks',
      'selected': false,
    },
    {
      'title': '🎭 Stage & Performance Makeup',
      'description': 'Theater, concerts, performances',
      'selected': false,
    },
    {
      'title': '📸 Photography Makeup',
      'description': 'Portrait and commercial photography',
      'selected': false,
    },
    {
      'title': '✨ Special Effects Makeup',
      'description': 'Creative and artistic looks',
      'selected': false,
    },
    {
      'title': '👰 Hair Styling',
      'description': 'Updos, styling for all occasions',
      'selected': false,
    },
  ];

  bool get _hasSelection =>
      services.any((service) => service['selected'] == true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.grey2),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 2/7',
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
            'What Services Do You Offer?',
            style: AppTextStyles.h5(
              color: AppColors.textColor1,
              weight: AppTextStyles.semiBoldText,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
               horizontal: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const SizedBox(height: 8),
                  // Subtitle
                  Center(
                    child: Text(
                      'Select all that apply',
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Services list
                  ...services.asMap().entries.map((entry) {
                    final index = entry.key;
                    final service = entry.value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            services[index]['selected'] =
                                !services[index]['selected'];
                          });
                        },
                        child: Row(
                          children: [
                            // Checkbox
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: service['selected']
                                    ? AppColors.orange
                                    : Colors.transparent,
                                border: Border.all(
                                  color: service['selected']
                                      ? AppColors.orange
                                      : AppColors.grey3,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: service['selected']
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 15),
                            // Service details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    service['title'],
                                    style: AppTextStyles.body1(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.regularText,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    service['description'],
                                    style: AppTextStyles.caption1(
                                      color: AppColors.grey2,
                                      weight: AppTextStyles.regularText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          // Continue button
          Container(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _hasSelection
                    ? () {
                        context.push('/artist/onboarding/set-pricing');
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
          ),
        ],
      ),
    );
  }
}
