import 'package:flutter/material.dart';
import '../../../../views/widgets/status_widget.dart';

class ModelApproved extends StatelessWidget {
  const ModelApproved({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.success,
      title: 'Congratulations!',
      message: 'Your profile has been approved. You can now start accepting booking requests from artists',
      buttonText: 'Go to Dashboard',
      onButtonPressed: () {
        // Navigate to model dashboard
        // context.go('/model/dashboard');
      },
    );
  }
}
