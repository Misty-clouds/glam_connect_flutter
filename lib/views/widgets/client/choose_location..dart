import 'package:flutter/material.dart';
import '../../../constants/styles/app_colors.dart';
import '../../../constants/styles/text_style.dart';

class ChooseLocationBottomSheet extends StatefulWidget {
  final String? currentLocation;
  const ChooseLocationBottomSheet({super.key, this.currentLocation});

  @override
  State<ChooseLocationBottomSheet> createState() => _ChooseLocationBottomSheetState();
}

class _ChooseLocationBottomSheetState extends State<ChooseLocationBottomSheet> {
  String selectedLocation = 'Dubai Marina';
  
  final List<Map<String, dynamic>> locations = [
    {'name': 'Dubai Marina', 'distance': '0.5 km'},
    {'name': 'JBR - Jumeirah Beach Residence', 'distance': '2.1 km'},
    {'name': 'Downtown Dubai', 'distance': '4.3 km'},
    {'name': 'Business Bay', 'distance': '3.8 km'},
    {'name': 'Jumeirah Lakes Towers', 'distance': '1.2 km'},
    {'name': 'Palm Jumeirah', 'distance': '5.6 km'},
    {'name': 'Dubai Mall', 'distance': '4.7 km'},
    {'name': 'City Walk', 'distance': '6.2 km'},
  ];

  @override
  void initState() {
    super.initState();
    // Get current location from widget property or default to Dubai Marina
    selectedLocation = widget.currentLocation ?? 'Dubai Marina';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey3,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose Location',
                  style: AppTextStyles.h5(
                    color: AppColors.textColor1,
                    weight: AppTextStyles.boldText,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, color: AppColors.grey2),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 54,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.grey5,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.grey2, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search location',
                        hintStyle: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: AppTextStyles.body2(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Current Location
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.orange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.my_location,
                    color: AppColors.orange,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use current location',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                      Text(
                        'Get precise location automatically',
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
          
          const SizedBox(height: 20),
          
          // Divider
          Divider(color: AppColors.grey4, height: 1),
          
          const SizedBox(height: 16),
          
          // Recent Locations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Recent locations',
              style: AppTextStyles.body1(
                color: AppColors.grey2,
                weight: AppTextStyles.mediumText,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Locations List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                final isSelected = location['name'] == selectedLocation;
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLocation = location['name'];
                    });
                    // Close bottom sheet and return selected location
                    Navigator.pop(context, location['name']);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    height: 77,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.orange.withOpacity(0.05) : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: isSelected ? AppColors.orange : AppColors.grey2,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                location['name'],
                                style: AppTextStyles.body1(
                                  color: isSelected ? AppColors.orange : AppColors.textColor1,
                                  weight: AppTextStyles.mediumText,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                location['distance'],
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to show the bottom sheet
Future<String?> showChooseLocationBottomSheet(BuildContext context, {String? currentLocation}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ChooseLocationBottomSheet(currentLocation: currentLocation),
  );
}
