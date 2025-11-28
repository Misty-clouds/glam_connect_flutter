import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../views/widgets/status_widget.dart';

class NeedsMoreInfo extends StatelessWidget {
  const NeedsMoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.error,
      title: 'Additional Information Required',
      message: 'We need some additional information to complete your profile verification:\n\n• Valid work certificate\n• Clear portfolio images\n• Updated contact information',
      buttonText: 'Update Profile',
      onButtonPressed: () {
        // Navigate back to profile editing
        context.go('/artist/onboarding/create-profile');
      },
    );
  }
}
