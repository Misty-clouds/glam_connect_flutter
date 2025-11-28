import 'package:flutter/material.dart';
import '../../../../views/widgets/status_widget.dart';

class UnderReview extends StatelessWidget {
  const UnderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.pending,
      title: 'Under Review',
      message: 'Your profile is currently under review. We\'ll notify you once it\'s approved',
      buttonText: 'Contact Support',
      onButtonPressed: () {
        // Navigate to support or open contact dialog
        // context.push('/support');
      },
    );
  }
}
