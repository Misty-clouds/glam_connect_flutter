import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../views/widgets/status_widget.dart';

class ModelUnderReview extends StatelessWidget {
  const ModelUnderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.pending,
      title: 'Under Review',
      message: 'Your profile is currently under review. We\'ll notify you once it\'s approved',
      buttonText: 'Go to Dashboard',
      onButtonPressed: () {
        context.go('/model/dashboard');
      },
    );
  }
}
