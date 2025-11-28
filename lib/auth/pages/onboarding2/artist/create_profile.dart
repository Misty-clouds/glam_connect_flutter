import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistCreateProfile extends StatefulWidget {
  const ArtistCreateProfile({super.key});

  @override
  State<ArtistCreateProfile> createState() => _ArtistCreateProfileState();
}

class _ArtistCreateProfileState extends State<ArtistCreateProfile> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? selectedCity;
  List<String> selectedAreas = [];
  List<Map<String, String>> serviceLocations = [];

  final List<String> cities = ['Riyadh', 'Dubai', 'Abu Dhabi', 'Jeddah'];
  final List<String> areas = [
    'Northern Riyadh',
    'Southern Riyadh',
    'Eastern Riyadh',
    'Western Riyadh',
    'Central Riyadh',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _addServiceLocation() {
    if (selectedCity != null && selectedAreas.isNotEmpty) {
      setState(() {
        serviceLocations.add({
          'city': selectedCity!,
          'areas': selectedAreas.join(', '),
        });
        selectedCity = null;
        selectedAreas.clear();
      });
    }
  }

  bool get _canContinue {
    return _fullNameController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        serviceLocations.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 1/7',
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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Center(
                    child: Text(
                      'Create Your Artist Profile',
                      style: AppTextStyles.h5(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.boldText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle
                  Center(
                    child: Text(
                      'Let\'s get you started',
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Full name
                  Text(
                    'Full name',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _fullNameController,
                    style: AppTextStyles.body2(color: AppColors.textColor1),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.grey5,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 20),
                  // Phone number
                  Text(
                    'Phone number',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    style: AppTextStyles.body2(color: AppColors.textColor1),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.grey5,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 20),
                  // Service location 1
                  Text(
                    'Service location 1',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedCity,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.grey5,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    hint: Text(
                      'Riyadh',
                      style: AppTextStyles.body2(color: AppColors.grey2),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey2),
                    items: cities
                        .map((city) => DropdownMenuItem(
                              value: city,
                              child: Text(
                                city,
                                style: AppTextStyles.body2(color: AppColors.textColor1),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // Areas checkboxes
                  ...areas.map((area) => CheckboxListTile(
                        value: selectedAreas.contains(area),
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              selectedAreas.add(area);
                            } else {
                              selectedAreas.remove(area);
                            }
                          });
                        },
                        title: Text(
                          area,
                          style: AppTextStyles.body2(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.regularText,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        activeColor: AppColors.grey3,
                        checkColor: AppColors.textColor1,
                      )),
                  const SizedBox(height: 16),
                  // Add another city button
                  TextButton.icon(
                    onPressed: _addServiceLocation,
                    icon: const Icon(Icons.add, color: AppColors.orange),
                    label: Text(
                      'Add city',
                      style: AppTextStyles.body2(
                        color: AppColors.orange,
                        weight: AppTextStyles.mediumText,
                      ),
                    ),
                  ),
                  // Display added service locations
                  if (serviceLocations.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    ...serviceLocations.map((location) => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.grey5,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location['city']!,
                                      style: AppTextStyles.body2(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                    Text(
                                      location['areas']!,
                                      style: AppTextStyles.caption1(
                                        color: AppColors.grey2,
                                        weight: AppTextStyles.regularText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close, color: AppColors.grey2, size: 20),
                                onPressed: () {
                                  setState(() {
                                    serviceLocations.remove(location);
                                  });
                                },
                              ),
                            ],
                          ),
                        )),
                  ],
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
                onPressed: _canContinue
                    ? () {
                        context.push('/artist/onboarding/select-services');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _canContinue ? AppColors.orange : AppColors.grey4,
                  foregroundColor: _canContinue ? Colors.white : AppColors.grey2,
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
