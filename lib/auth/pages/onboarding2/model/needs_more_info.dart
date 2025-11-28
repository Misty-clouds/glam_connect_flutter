import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../views/widgets/status_widget.dart';

class ModelNeedsMoreInfo extends StatelessWidget {
  const ModelNeedsMoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.error,
      title: 'Additional Information Required',
      message: 'We need some additional information to complete your profile verification:\n\n• Clear, high-quality portfolio photos\n• Valid identification document\n• Updated contact information',
      buttonText: 'Update Profile',
      onButtonPressed: () {
        // Navigate back to profile editing
        context.go('/model/onboarding/create-profile');
      },
    );
  }
}
