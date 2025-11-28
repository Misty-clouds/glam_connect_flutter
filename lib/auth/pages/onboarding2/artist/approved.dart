import 'package:flutter/material.dart';
import '../../../../views/widgets/status_widget.dart';

class Approved extends StatelessWidget {
  const Approved({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.success,
      title: 'Congratulations!',
      message: 'Your profile has been approved. You can now start accepting bookings',
      buttonText: 'Go to Dashboard',
      onButtonPressed: () {
        // Navigate to artist dashboard
        // context.go('/artist/dashboard');
      },
    );
  }
}
