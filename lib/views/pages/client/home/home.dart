import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';
import '../../../widgets/client/choose_location..dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  int selectedCategoryIndex = 0;
  final List<String> categories = ['Available today', 'Bridal', 'Events', 'Nearby'];
  String selectedLocation = 'Dubai Marina';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/cover.png'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Abdullah',
                            style: AppTextStyles.h6(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final result = await showChooseLocationBottomSheet(context, currentLocation: selectedLocation);
                              if (result != null) {
                                setState(() {
                                  selectedLocation = result;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: AppColors.orange, size: 16),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    selectedLocation,
                                    style: AppTextStyles.body2(
                                      color: AppColors.grey2,
                                      weight: AppTextStyles.regularText,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down, color: AppColors.grey2, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_outlined, size: 24),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.grey5,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppColors.grey2),
                      const SizedBox(width: 12),
                      Text(
                        'Search artists, services, or styles',
                        style: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Category Tabs
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedCategoryIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected?AppColors.orange
                            : AppColors.beige,
                            borderRadius: BorderRadius.circular(20),
                            border: isSelected ? Border.all(color: AppColors.orange.withValues(alpha: 0.5)) : null,
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: AppTextStyles.body2(
                                color: isSelected ? AppColors.background : AppColors.grey2,
                                weight: AppTextStyles.mediumText,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Featured Section
                Text(
                  'Featured',
                  style: AppTextStyles.body1(
                    color: AppColors.textColor1,
                    weight: AppTextStyles.mediumText,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Featured Artists Grid
                SizedBox(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 263,
                        width: 273,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: AppColors.beige,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Artist Image
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/cover.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Service Info
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bridal Makeup',
                                        style: AppTextStyles.body1(
                                          color: AppColors.textColor1,
                                          weight: AppTextStyles.mediumText,
                                        ),
                                      ),
                                      Text(
                                        'SAR 250',
                                        style: AppTextStyles.body1(
                                          color: AppColors.textColor1,
                                          weight: AppTextStyles.boldText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 4),
                                  
                                  // Rating
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: AppColors.orange, size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        '4.5',
                                        style: AppTextStyles.body2(
                                          color: AppColors.textColor1,
                                          weight: AppTextStyles.mediumText,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '(90 reviews)',
                                        style: AppTextStyles.body2(
                                          color: AppColors.grey2,
                                          weight: AppTextStyles.regularText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 8),
                                  
                                  // Artist Info
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: AssetImage('assets/images/cover.png'),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sarah Al-Mansouri',
                                              style: AppTextStyles.body2(
                                                color: AppColors.textColor1,
                                                weight: AppTextStyles.mediumText,
                                              ),
                                            ),
                                            Text(
                                              'Artist',
                                              style: AppTextStyles.caption2(
                                                color: AppColors.grey2,
                                                weight: AppTextStyles.regularText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined, size: 14, color: AppColors.grey2),
                                          const SizedBox(width: 2),
                                          Text(
                                            '1.2km',
                                            style: AppTextStyles.caption2(
                                              color: AppColors.grey2,
                                              weight: AppTextStyles.regularText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Browse by category
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Browse by category',
                      style: AppTextStyles.h6(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.boldText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push('/client/categories');
                      },
                      child: Text(
                        'See all',
                        style: AppTextStyles.body2(
                          color: AppColors.orange,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Category Grid
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final categoryNames = ['Bridal Makeup', 'Photoshoot', 'Events'];
                      final categoryIcons = ['💄', '📸', '🎉'];
                      
                      return Container(
                        width: 150,
                        height: 100,
                        margin: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            Container(
                              height:100,
                              width: 150,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.beige,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.start 
                                ,
                                children: [
                                  Text(categoryIcons[index]),
                                  Text(
                                    categoryNames[index],
                                    style: AppTextStyles.body2(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.mediumText,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '120 Artists',
                                    style: AppTextStyles.caption2(
                                      color: AppColors.grey2,
                                      weight: AppTextStyles.regularText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Available today
                Text(
                  'Available today',
                  style: AppTextStyles.h6(
                    color: AppColors.textColor1,
                    weight: AppTextStyles.boldText,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Available Artists
                Column(
                  children: List.generate(2, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Artist Image
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: AssetImage('assets/images/cover.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Service Info
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bridal Makeup',
                                      style: AppTextStyles.body1(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                    Text(
                                      'SAR 250',
                                      style: AppTextStyles.body1(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.boldText,
                                      ),
                                    ),
                                  ],
                                ),
                                
                                const SizedBox(height: 4),
                                
                                // Rating
                                Row(
                                  children: [
                                    Icon(Icons.star, color: AppColors.orange, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      '4.5',
                                      style: AppTextStyles.body2(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '(90 reviews)',
                                      style: AppTextStyles.body2(
                                        color: AppColors.grey2,
                                        weight: AppTextStyles.regularText,
                                      ),
                                    ),
                                  ],
                                ),
                                
                                const SizedBox(height: 8),
                                
                                // Artist Info
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundImage: AssetImage('assets/images/cover.png'),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sarah Al-Mansouri',
                                            style: AppTextStyles.body2(
                                              color: AppColors.textColor1,
                                              weight: AppTextStyles.mediumText,
                                            ),
                                          ),
                                          Text(
                                            'Artist',
                                            style: AppTextStyles.caption2(
                                              color: AppColors.grey2,
                                              weight: AppTextStyles.regularText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined, size: 14, color: AppColors.grey2),
                                        const SizedBox(width: 2),
                                        Text(
                                          '1.2km',
                                          style: AppTextStyles.caption2(
                                            color: AppColors.grey2,
                                            weight: AppTextStyles.regularText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                
                                const SizedBox(height: 12),
                                
                                // Book Now Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Text(
                                      'Book now',
                                      style: AppTextStyles.body1(
                                        color: Colors.white,
                                        weight: AppTextStyles.semiBoldText,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
