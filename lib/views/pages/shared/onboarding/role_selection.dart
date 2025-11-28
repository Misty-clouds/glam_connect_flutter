import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/auth/providers/auth_providers.dart';
import '/constants/styles/app_colors.dart';
import '/constants/styles/text_style.dart';

class RoleSelectionPage extends ConsumerStatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  ConsumerState<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends ConsumerState<RoleSelectionPage> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Title - Center aligned
              Center(
                child: Text(
                  'Welcome to GlamConnect',
                  style: AppTextStyles.h5(
                    color: AppColors.plum,
                    weight: AppTextStyles.boldText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              // Subtitle - Center aligned
              Center(
                child: Text(
                  'How would you like to use GlamConnect today?',
                  style: AppTextStyles.body2(
                    color: AppColors.grey2,
                    weight: AppTextStyles.regularText,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              // Role Cards
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildRoleCard(
                        role: 'client',
                        title: 'Looking for an Artist',
                        description: 'Book professional makeup artists for any occasion',
                        imagePath: 'assets/images/role1.png',
                        isSelected: selectedRole == 'client',
                      ),
                      const SizedBox(height: 16),
                      _buildRoleCard(
                        role: 'artist',
                        title: 'I\'m a Makeup Artist',
                        description: 'Grow your business and connect with clients',
                        imagePath: 'assets/images/role2.png',
                        isSelected: selectedRole == 'artist',
                      ),
                      const SizedBox(height: 16),
                      _buildRoleCard(
                        role: 'model',
                        title: 'I\'m a Model',
                        description: 'Find makeup opportunities and collaborate with artists',
                        imagePath: 'assets/images/role3.png',
                        isSelected: selectedRole == 'model',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Get Started Button - Only show when role is selected
              if (selectedRole != null)
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Update the Riverpod provider
                      ref.read(userRoleProvider.notifier).state = selectedRole;
                      // Navigate to signup page
                      context.push('/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Get Started',
                      style: AppTextStyles.body1(
                        color: AppColors.textColor,
                        weight: AppTextStyles.semiBoldText,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String role,
    required String title,
    required String description,
    required String imagePath,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role;
        });
      },
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.beige,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.plum : Colors.transparent,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            SizedBox(
              height: 70,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            // Title
            Text(
              title,
              style: AppTextStyles.subHeadline(
                color: AppColors.plum,
                weight: AppTextStyles.boldText,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Description
            Flexible(
              child: Text(
                description,
                style: AppTextStyles.caption1(
                  color: AppColors.grey2,
                  weight: AppTextStyles.regularText,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}