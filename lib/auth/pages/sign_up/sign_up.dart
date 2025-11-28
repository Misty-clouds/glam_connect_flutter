import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/styles/app_colors.dart';
import '../../../constants/styles/text_style.dart';
import '../../providers/auth_providers.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _neighborhoodController.dispose();
    super.dispose();
  }

  String _getTitle(String? role) {
    if (role == 'client') {
      return 'Start Your Beauty Journey';
    } else {
      return 'Start Your Journey';
    }
  }

  String _getSubtitle(String? role) {
    if (role == 'client') {
      return 'Create your account to book amazing artists';
    } else {
      return 'Create your GlamConnect account';
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedRole = ref.watch(userRoleProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios),
                    color: AppColors.plum,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  const SizedBox(height: 24),
                  // Title
                  Center(
                    child: Text(
                      _getTitle(selectedRole),
                      style: AppTextStyles.h5(
                        color: AppColors.plum,
                        weight: AppTextStyles.boldText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Subtitle
                  Center(
                    child: Text(
                      _getSubtitle(selectedRole),
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Email address
                  Text(
                    'Email address',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: AppTextStyles.body2(color: AppColors.textColor1),
                    decoration: InputDecoration(
                      hintText: 'jane@gmail.com',
                      filled: true,
                      fillColor: AppColors.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _emailError != null ? AppColors.error1 : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _emailError != null ? AppColors.error1 : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _emailError != null ? AppColors.error1 : AppColors.plum,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    onChanged: (value) {
                      if (_emailError != null) {
                        setState(() {
                          _emailError = null;
                        });
                      }
                    },
                  ),
                  if (_emailError != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      _emailError!,
                      style: AppTextStyles.caption1(
                        color: AppColors.error1,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  // Password
                  Text(
                    'Password',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: AppTextStyles.body2(color: AppColors.textColor1),
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: AppColors.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _passwordError != null ? AppColors.error1 : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _passwordError != null ? AppColors.error1 : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: _passwordError != null ? AppColors.error1 : AppColors.plum,
                          width: 2,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: AppColors.grey2,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      if (_passwordError != null) {
                        setState(() {
                          _passwordError = null;
                        });
                      }
                    },
                  ),
                  if (_passwordError != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      _passwordError!,
                      style: AppTextStyles.caption1(
                        color: AppColors.error1,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  // Country
                  Text(
                    'Country',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _countryController,
                    style: AppTextStyles.body2(color: AppColors.textColor1),
                    decoration: InputDecoration(
                      hintText: 'UAE',
                      filled: true,
                      fillColor: AppColors.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // City
                  Text(
                    'City',
                    style: AppTextStyles.body2(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.mediumText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: null,
                    decoration: InputDecoration(
                      hintText: 'Dubai',
                      filled: true,
                      fillColor: AppColors.beige,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey2),
                    items: ['Dubai', 'Abu Dhabi', 'Sharjah', 'Ajman']
                        .map((city) => DropdownMenuItem(
                              value: city,
                              child: Text(
                                city,
                                style: AppTextStyles.body2(color: AppColors.textColor1),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _cityController.text = value ?? '';
                    },
                  ),
                  const SizedBox(height: 20),
                  // Neighbourhood area (only for client)
                  if (selectedRole == 'client') ...[
                    Text(
                      'Neighbourhood area',
                      style: AppTextStyles.body2(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.mediumText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: null,
                      decoration: InputDecoration(
                        hintText: 'Dubai',
                        filled: true,
                        fillColor: AppColors.beige,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.grey2),
                      items: ['Downtown Dubai', 'Dubai Marina', 'Jumeirah', 'Business Bay']
                          .map((area) => DropdownMenuItem(
                                value: area,
                                child: Text(
                                  area,
                                  style: AppTextStyles.body2(color: AppColors.textColor1),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        _neighborhoodController.text = value ?? '';
                      },
                    ),
                    const SizedBox(height: 32),
                  ] else
                    const SizedBox(height: 32),
                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate
                        setState(() {
                          _emailError = _emailController.text.isEmpty ? 'Invalid email address' : null;
                          _passwordError = _passwordController.text.isEmpty ? 'Please input a password' : null;
                        });
                        
                        if (_emailError == null && _passwordError == null) {
                          // Handle registration and navigate based on role
                          if (selectedRole == 'artist') {
                            // Artist goes to payment flow first
                            context.go('/artist/subscription');
                          } else if (selectedRole == 'model') {
                            // Model goes directly to onboarding
                            context.go('/model/onboarding/create-profile');
                          } else if (selectedRole == 'client') {
                            // Client goes directly to home
                            context.go('/client/dashboard');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Register',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor,
                          weight: AppTextStyles.semiBoldText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Or register with
                  Center(
                    child: Text(
                      'Or register with',
                      style: AppTextStyles.body2(
                        color: AppColors.grey2,
                        weight: AppTextStyles.regularText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Social buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle Google sign up
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.beige,
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Google',
                                style: AppTextStyles.body2(
                                  color: AppColors.textColor1,
                                  weight: AppTextStyles.mediumText,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text('G', style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Handle Apple sign up
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.beige,
                            side: BorderSide.none,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Apple',
                                style: AppTextStyles.body2(
                                  color: AppColors.textColor1,
                                  weight: AppTextStyles.mediumText,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.apple, color: AppColors.textColor1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Already have an account
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: AppTextStyles.body2(
                            color: AppColors.grey2,
                            weight: AppTextStyles.regularText,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go('login');
                          },
                          child: Text(
                            'Login',
                            style: AppTextStyles.body2(
                              color: AppColors.orange,
                              weight: AppTextStyles.semiBoldText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Terms and Privacy
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyles.caption1(
                          color: AppColors.grey2,
                          weight: AppTextStyles.regularText,
                        ),
                        children: [
                          const TextSpan(text: 'By continuing, you agree to our '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: AppTextStyles.caption1(
                              color: AppColors.orange,
                              weight: AppTextStyles.regularText,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: AppTextStyles.caption1(
                              color: AppColors.orange,
                              weight: AppTextStyles.regularText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}