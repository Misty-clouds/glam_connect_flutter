import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/index.dart';

class ModelPhysicalDetails extends StatefulWidget {
  const ModelPhysicalDetails({super.key});

  @override
  State<ModelPhysicalDetails> createState() => _ModelPhysicalDetailsState();
}

class _ModelPhysicalDetailsState extends State<ModelPhysicalDetails> {
  final _cmController = TextEditingController();
  int? _selectedFeet;
  int? _selectedInches;
  String? _selectedSkinTone;
  String? _selectedHairColor;
  String? _selectedEyeColor;
  
  final List<int> _feet = List.generate(5, (index) => index + 4); // 4-8 feet
  final List<int> _inches = List.generate(12, (index) => index); // 0-11 inches
  final List<String> _skinTones = ['Fair', 'Light', 'Medium', 'Olive', 'Tan', 'Brown', 'Dark'];
  final List<String> _hairColors = ['Black', 'Brown', 'Blonde', 'Red', 'Auburn', 'Gray', 'Other'];
  final List<String> _eyeColors = ['Brown', 'Blue', 'Green', 'Hazel', 'Gray', 'Amber'];

  @override
  void dispose() {
    _cmController.dispose();
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                'Step 4/4',
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
                        'Physical details',
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
                        'More details',
                        style: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    // Height
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Height',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            value: _selectedFeet,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.grey5,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                            hint: Text(
                              '2',
                              style: AppTextStyles.body1(
                                color: AppColors.grey2,
                                weight: AppTextStyles.regularText,
                              ),
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey2,
                            ),
                            style: AppTextStyles.body1(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.regularText,
                            ),
                            items: _feet.map((feet) {
                              return DropdownMenuItem(
                                value: feet,
                                child: Text('$feet'),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedFeet = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Feet',
                          style: AppTextStyles.body1(
                            color: AppColors.grey2,
                            weight: AppTextStyles.regularText,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            value: _selectedInches,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.grey5,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                            ),
                            hint: Text(
                              '30',
                              style: AppTextStyles.body1(
                                color: AppColors.grey2,
                                weight: AppTextStyles.regularText,
                              ),
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.grey2,
                            ),
                            style: AppTextStyles.body1(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.regularText,
                            ),
                            items: _inches.map((inches) {
                              return DropdownMenuItem(
                                value: inches,
                                child: Text('$inches'),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedInches = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Inches',
                          style: AppTextStyles.body1(
                            color: AppColors.grey2,
                            weight: AppTextStyles.regularText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Or',
                        style: AppTextStyles.body2(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _cmController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '0cm',
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
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Skin tone
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Skin tone',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedSkinTone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey5,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.grey2,
                      ),
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                      items: _skinTones.map((tone) {
                        return DropdownMenuItem(
                          value: tone,
                          child: Text(tone),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedSkinTone = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    // Hair colour
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hair colour',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedHairColor,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey5,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.grey2,
                      ),
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                      items: _hairColors.map((color) {
                        return DropdownMenuItem(
                          value: color,
                          child: Text(color),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedHairColor = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    // Eye colour
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Eye colour',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.mediumText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedEyeColor,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.grey5,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.grey2,
                      ),
                      style: AppTextStyles.body1(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                      items: _eyeColors.map((color) {
                        return DropdownMenuItem(
                          value: color,
                          child: Text(color),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedEyeColor = value;
                        });
                      },
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
                    context.push('/model/onboarding/review');
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
