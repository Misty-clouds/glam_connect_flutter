import 'package:flutter/material.dart';
import 'package:glam_connect/views/pages/shared/onboarding/splash_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const SplashScreen(),
    );
  }
}