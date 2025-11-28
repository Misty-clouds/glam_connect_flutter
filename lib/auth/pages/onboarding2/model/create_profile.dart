import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/index.dart';

class ModelCreateProfile extends StatefulWidget {
  const ModelCreateProfile({super.key});

  @override
  State<ModelCreateProfile> createState() => _ModelCreateProfileState();
}

class _ModelCreateProfileState extends State<ModelCreateProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  
  String? _selectedGender;
  String? _selectedLocation;
  
  final List<String> _genders = ['Male', 'Female', 'Other', 'Prefer not to say'];
  final List<String> _locations = ['Dubai', 'Abu Dhabi', 'Sharjah', 'Ajman', 'Ras Al Khaimah'];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2005, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.orange,
              onPrimary: Colors.white,
              onSurface: AppColors.textColor1,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
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
                'Step 1/4',
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Create Your Model Profile',
                          style: AppTextStyles.h5(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.boldText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'You must be 18 or older',
                          style: AppTextStyles.body2(
                            color: AppColors.grey2,
                            weight: AppTextStyles.regularText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Full name
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Full name',
                          style: AppTextStyles.body2(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
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
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Phone number
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phone number',
                          style: AppTextStyles.body2(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
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
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Date of birth
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Date of birth',
                          style: AppTextStyles.body2(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _dobController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
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
                          suffixIcon: const Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.grey2,
                            size: 20,
                          ),
                        ),
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: Text(
                          'Tell us about yourself',
                          style: AppTextStyles.body2(
                            color: AppColors.grey2,
                            weight: AppTextStyles.regularText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Gender
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Gender',
                          style: AppTextStyles.body2(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
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
                        items: _genders.map((gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // Location
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Location',
                          style: AppTextStyles.body2(
                            color: AppColors.textColor1,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: _selectedLocation,
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
                        items: _locations.map((location) {
                          return DropdownMenuItem(
                            value: location,
                            child: Text(location),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedLocation = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // My location button
                      InkWell(
                        onTap: () {
                          // Handle current location
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.grey3),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFF5F0),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.my_location,
                                  color: AppColors.orange,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My location',
                                    style: AppTextStyles.body1(
                                      color: AppColors.textColor1,
                                      weight: AppTextStyles.mediumText,
                                    ),
                                  ),
                                  Text(
                                    'Use current location',
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
                      context.push('/model/onboarding/experience-interest');
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
      ),
    );
  }
}
