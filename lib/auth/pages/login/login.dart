import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _hasEmailError = false;
  bool _hasPasswordError = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please input a password';
    }
    return null;
  }

  void _handleLogin() {
    setState(() {
      _hasEmailError = _validateEmail(_emailController.text) != null;
      _hasPasswordError = _validatePassword(_passwordController.text) != null;
    });

    if (!_hasEmailError && !_hasPasswordError) {
      // Handle login logic
      // context.go('/client/home'); // or artist/home or model/home based on user type
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5E6FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor1),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Welcome Back title
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: AppTextStyles.h3(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.boldText,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    'Login to your account to continue enjoying\nGlamConnect',
                    style: AppTextStyles.body1(
                      color: AppColors.textColor1,
                      weight: AppTextStyles.regularText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 48),
                
                // Email address
                Text(
                  'Email address',
                  style: AppTextStyles.body1(
                    color: AppColors.textColor1,
                    weight: AppTextStyles.mediumText,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    if (_hasEmailError) {
                      setState(() {
                        _hasEmailError = _validateEmail(value) != null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'jane@gmail.com',
                    hintStyle: AppTextStyles.body1(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _hasEmailError ? Colors.red : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _hasEmailError ? Colors.red : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _hasEmailError ? Colors.red : AppColors.orange,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
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
                if (_hasEmailError) ...[
                  const SizedBox(height: 8),
                  Text(
                    _validateEmail(_emailController.text) ?? '',
                    style: AppTextStyles.body2(
                      color: Colors.red,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                
                // Password
                Text(
                  'Password',
                  style: AppTextStyles.body1(
                    color: AppColors.textColor1,
                    weight: AppTextStyles.mediumText,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onChanged: (value) {
                    if (_hasPasswordError) {
                      setState(() {
                        _hasPasswordError = _validatePassword(value) != null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'RTYU6890bo',
                    hintStyle: AppTextStyles.body1(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _hasPasswordError ? Colors.red : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _hasPasswordError ? Colors.red : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: _hasPasswordError ? Colors.red : AppColors.orange,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
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
                  style: AppTextStyles.body1(
                    color: AppColors.textColor1,
                    weight: AppTextStyles.regularText,
                  ),
                ),
                if (_hasPasswordError) ...[
                  const SizedBox(height: 8),
                  Text(
                    _validatePassword(_passwordController.text) ?? '',
                    style: AppTextStyles.body2(
                      color: Colors.red,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                
                // Forgot Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      context.push('/reset-password');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Forgot Password',
                      style: AppTextStyles.body1(
                        color: AppColors.orange,
                        weight: AppTextStyles.mediumText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Login button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Login',
                      style: AppTextStyles.body1(
                        color: Colors.white,
                        weight: AppTextStyles.semiBoldText,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                
                // Or login with
                Center(
                  child: Text(
                    'Or login with',
                    style: AppTextStyles.body1(
                      color: AppColors.grey2,
                      weight: AppTextStyles.regularText,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Social login buttons
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Handle Google login
                          },
                          icon: const Text('G', style: TextStyle(fontSize: 24)),
                          label: Text(
                            'Google',
                            style: AppTextStyles.body1(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Handle Apple login
                          },
                          icon: const Icon(Icons.apple, size: 24, color: Colors.black),
                          label: Text(
                            'Apple',
                            style: AppTextStyles.body1(
                              color: AppColors.textColor1,
                              weight: AppTextStyles.mediumText,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                
                // Don't have an account
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: AppTextStyles.body1(
                          color: AppColors.textColor1,
                          weight: AppTextStyles.regularText,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/signup');
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(50, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Sign up',
                          style: AppTextStyles.body1(
                            color: AppColors.orange,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Terms and Privacy Policy
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: AppTextStyles.body2(
                        color: AppColors.textColor1,
                        weight: AppTextStyles.regularText,
                      ),
                      children: [
                        const TextSpan(text: 'By continuing, you agree to our '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: AppTextStyles.body2(
                            color: AppColors.orange,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                        const TextSpan(text: '\nand '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.body2(
                            color: AppColors.orange,
                            weight: AppTextStyles.mediumText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
