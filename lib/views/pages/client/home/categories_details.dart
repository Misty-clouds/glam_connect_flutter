import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';


class CategoriesDetails extends StatefulWidget {
  const CategoriesDetails({super.key});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetails();
}

class _CategoriesDetails extends State<CategoriesDetails> {
  int selectedCategoryIndex = 0;
  final List<String> categories = ['Available today', 'Nearby', 'Top Rated'];
  String selectedLocation = 'Dubai Marina';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bridal",style: AppTextStyles.subHeadline(color: AppColors.textColor1),),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      
      backgroundColor: Colors.white,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
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
                        'Search',
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
