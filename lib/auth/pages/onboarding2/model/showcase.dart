import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/index.dart';

class ModelShowcase extends StatefulWidget {
  const ModelShowcase({super.key});

  @override
  State<ModelShowcase> createState() => _ModelShowcaseState();
}

class _ModelShowcaseState extends State<ModelShowcase> {
  final List<String> _photos = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    if (_photos.length >= 12) return;
    
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    
    if (image != null) {
      setState(() {
        _photos.add(image.path);
      });
    }
  }

  void _removePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 3/4',
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
                        'Showcase Yourself',
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
                        'Upload 6-12 high-quality photos of yourself. These help artists see if you\'re the right fit for their shoots.',
                        style: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Your photos label
                    Text(
                      'Your photos',
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.mediumText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Photo grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        if (index < _photos.length) {
                          // Photo with delete button
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(_photos[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () => _removePhoto(index),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.delete_outline,
                                      size: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (index == _photos.length && _photos.length < 12) {
                          // Add photo button
                          return GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.grey3,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: AppColors.grey2,
                                size: 32,
                              ),
                            ),
                          );
                        } else {
                          // Empty placeholder
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    
                    // Photo count
                    Text(
                      '${_photos.length} / 12 photos • Minimum 6 required',
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Photo guidelines
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5E6FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Photo guidelines',
                            style: AppTextStyles.body1(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.semiBoldText,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildGuideline('✓', 'Include headshots and full-body'),
                          _buildGuideline('✓', 'Show different angles and expressions'),
                          _buildGuideline('✓', 'Clear, well-lit photos'),
                          _buildGuideline('✓', 'High resolution'),
                          const SizedBox(height: 12),
                          _buildGuideline('✗', 'No filters or heavy editing'),
                          _buildGuideline('✗', 'No group photos'),
                          _buildGuideline('✗', 'No sunglasses or face coverings'),
                        ],
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
                  onPressed: _photos.length >= 6
                      ? () {
                          context.push('/model/onboarding/physical-details');
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
                      color: _photos.length >= 6 ? Colors.white : AppColors.grey2,
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

  Widget _buildGuideline(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            icon,
            style: AppTextStyles.body1(
              color: icon == '✓' ? Colors.green : Colors.red,
              weight: AppTextStyles.mediumText,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body2(
                color: AppColors.textColor1,
                weight: AppTextStyles.regularText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
