import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../views/widgets/status_widget.dart';

class PaymentError extends StatelessWidget {
  const PaymentError({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusWidget(
      type: StatusType.error,
      title: 'Oops',
      message: 'There was an error verifying your subscription, please retry the process',
      buttonText: 'Retry',
      onButtonPressed: () {
        context.go('/artist/subscription');
      },
    );
  }
}
