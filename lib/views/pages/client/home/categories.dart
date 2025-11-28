import 'package:flutter/material.dart';
import 'package:glam_connect/constants/index.dart';
import 'package:glam_connect/constants/styles/text_style.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, dynamic>> categoriesList = [
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.camera_alt,
      "title": "Photoshoot",
      "artists": "120 Artists",
      "color": Colors.yellow.withOpacity(0.1),
      "iconColor": Colors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
    {
      "icon": Icons.face_retouching_natural,
      "title": "Bridal Makeup",
      "artists": "120 Artists",
      "color": AppColors.orange.withOpacity(0.1),
      "iconColor": AppColors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
        ),
        title: Text(
          "All categories",
          style: AppTextStyles.h5(
            color: AppColors.textColor1,
            weight: AppTextStyles.boldText,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            final category = categoriesList[index];
            
            return GestureDetector(
              onTap: () {
                // Handle category selection
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: category['color'],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        category['icon'],
                        size: 24,
                        color: category['iconColor'],
                      ),
                    ),
                    
                    const Spacer(),
                    
                    // Category Title
                    Text(
                      category['title'],
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.boldText,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Artists Count
                    Text(
                      category['artists'],
                      style: AppTextStyles.caption1(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}