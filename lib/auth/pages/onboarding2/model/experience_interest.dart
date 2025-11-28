import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/index.dart';

class ModelExperienceInterest extends StatefulWidget {
  const ModelExperienceInterest({super.key});

  @override
  State<ModelExperienceInterest> createState() => _ModelExperienceInterestState();
}

class _ModelExperienceInterestState extends State<ModelExperienceInterest> {
  String? _selectedExperience;
  final Set<String> _selectedInterests = {};
  final _bioController = TextEditingController();
  
  final List<Map<String, String>> _experienceLevels = [
    {'title': 'Beginner', 'subtitle': 'Just starting out'},
    {'title': 'Some experience', 'subtitle': 'Done a few shoots'},
    {'title': 'Experienced', 'subtitle': 'Regular model work'},
    {'title': 'Professional', 'subtitle': 'Full time professional model'},
  ];
  
  final List<Map<String, dynamic>> _shootTypes = [
    {'icon': '💄', 'title': 'Bridal Makeup', 'subtitle': 'Traditional and modern bridal looks'},
    {'icon': '🎭', 'title': 'Event Makeup', 'subtitle': 'Parties, galas, special occasions'},
    {'icon': '👗', 'title': 'Fashion & Runway Makeup', 'subtitle': 'Fashion shows, runway, campaigns'},
  ];

  @override
  void dispose() {
    _bioController.dispose();
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
          'Step 2/6',
          style: AppTextStyles.body1(
            color: AppColors.grey2,
            weight: AppTextStyles.regularText,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 2/6',
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
                        'Experience and interest',
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
                        'Your modelling experience',
                        style: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Experience level
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Experience level',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._experienceLevels.map((level) {
                      final isSelected = _selectedExperience == level['title'];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedExperience = level['title'];
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected ? AppColors.orange : AppColors.grey2,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      level['title']!,
                                      style: AppTextStyles.body1(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                    Text(
                                      level['subtitle']!,
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
                      );
                    }).toList(),
                    const SizedBox(height: 32),
                    
                    // What type of shoots interest you
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What type of shoots interest you',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ..._shootTypes.map((shoot) {
                      final isSelected = _selectedInterests.contains(shoot['title']);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedInterests.remove(shoot['title']);
                              } else {
                                _selectedInterests.add(shoot['title']);
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: isSelected ? AppColors.orange : AppColors.grey2,
                                      width: 2,
                                    ),
                                    color: isSelected ? AppColors.orange : Colors.transparent,
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  shoot['icon'],
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shoot['title'],
                                        style: AppTextStyles.body1(
                                          color: AppColors.textColor1,
                                          weight: AppTextStyles.mediumText,
                                        ),
                                      ),
                                      Text(
                                        shoot['subtitle'],
                                        style: AppTextStyles.body2(
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
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 32),
                    
                    // Brief bio
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Brief bio',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _bioController,
                      maxLines: 4,
                      maxLength: 500,
                      decoration: InputDecoration(
                        hintText: 'Tell artists about yoursel',
                        hintStyle: AppTextStyles.body1(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        filled: true,
                        fillColor: AppColors.grey5,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        counterStyle: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/model/onboarding/showcase');
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
            ),
          ],
        ),
      ),
    );
  }
}
