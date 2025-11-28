import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/styles/app_colors.dart';
import '../../../../constants/styles/text_style.dart';

class ArtistShowcaseWork extends StatefulWidget {
  const ArtistShowcaseWork({super.key});

  @override
  State<ArtistShowcaseWork> createState() => _ArtistShowcaseWorkState();
}

class _ArtistShowcaseWorkState extends State<ArtistShowcaseWork> {
  // Services selected from previous step (in real app, pass via route params or state management)
  final List<Map<String, dynamic>> selectedServices = [
    {'title': '💍 Bridal Makeup', 'photos': <XFile>[], 'expanded': true},
    {'title': '🎊 Event Makeup', 'photos': <XFile>[], 'expanded': false},
    {'title': '👗 Fashion & Runway Makeup', 'photos': <XFile>[], 'expanded': false},
  ];

  final int maxPhotos = 12;
  final int minPhotos = 3;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int serviceIndex) async {
    final photos = selectedServices[serviceIndex]['photos'] as List<XFile>;
    
    if (photos.length >= maxPhotos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Maximum $maxPhotos photos allowed'),
          backgroundColor: AppColors.error1,
        ),
      );
      return;
    }

    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    
    if (image != null) {
      setState(() {
        photos.add(image);
      });
    }
  }

  void _removeImage(int serviceIndex, int photoIndex) {
    setState(() {
      final photos = selectedServices[serviceIndex]['photos'] as List<XFile>;
      photos.removeAt(photoIndex);
    });
  }

  bool get canContinue {
    return selectedServices.every((service) => 
      (service['photos'] as List<XFile>).length >= minPhotos
    );
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
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 4/7',
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
                children: [
                  // Centered Title
                  Center(
                    child: Text(
                      'Showcase Your Work',
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
                      'Upload photos of your best work for each service. High-quality images help attract more clients.',
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Services List
                  ...selectedServices.asMap().entries.map((entry) {
                    final serviceIndex = entry.key;
                    final service = entry.value;
                    final serviceTitle = service['title'] as String;
                    final photos = service['photos'] as List<XFile>;
                    final isExpanded = service['expanded'] as bool;
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        border: const Border(bottom: BorderSide(color: AppColors.grey4)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          // Dropdown Header
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedServices[serviceIndex]['expanded'] = !isExpanded;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      serviceTitle,
                                      style: AppTextStyles.body1(
                                        color: AppColors.textColor1,
                                        weight: AppTextStyles.mediumText,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                    color: AppColors.grey2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Expanded Content
                          if (isExpanded) ...[
                            const Divider(height: 1, color: AppColors.grey4),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Photo Grid
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                      childAspectRatio: 1,
                                    ),
                                    itemCount: maxPhotos,
                                    itemBuilder: (context, index) {
                                      if (index < photos.length) {
                                        // Photo with delete button
                                        return Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image: FileImage(File(photos[index].path)),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 2,
                                              right: 2,
                                              child: GestureDetector(
                                                onTap: () => _removeImage(serviceIndex, index),
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.red,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else if (index == photos.length) {
                                        // Add button
                                        return GestureDetector(
                                          onTap: () => _pickImage(serviceIndex),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.grey5,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: AppColors.grey2,
                                              size: 24,
                                            ),
                                          ),
                                        );
                                      } else {
                                        // Empty box
                                        return Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.grey4),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '${photos.length} / $maxPhotos photos • Minimum $minPhotos required',
                                    style: AppTextStyles.body2(
                                      color: AppColors.grey2,
                                      weight: AppTextStyles.regularText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  }).toList(),
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
                onPressed: canContinue
                    ? () {
                        context.push('/artist/onboarding/availability');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  disabledBackgroundColor: AppColors.grey4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
    );
  }
}
