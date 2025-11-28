import 'dart:async';

import 'package:flutter/material.dart';
import '/constants/styles/index.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideUpAnimation;
  late Animation<double> _slideLeftAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    // Slide up animation - rises from bottom to center
    _slideUpAnimation = Tween<double>(begin: 200.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Slide left animation - moves logo to the left after rising
    _slideLeftAnimation = Tween<double>(begin: 0.0, end: -80.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeInOut),
      ),
    );

    // Text fade in animation - text appears as logo moves left
    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8, curve: Curves.easeIn),
      ),
    );

    // Start animation after a brief delay
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });

    // Navigate after animation completes
    Timer(const Duration(milliseconds: 4000), () {
      if (mounted) {
        context.replace('/onboarding');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plum,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Chair logo that rises up then slides left
                Transform.translate(
                  offset: Offset(
                    _slideLeftAnimation.value,
                    _slideUpAnimation.value,
                  ),
                  child: Image.asset(
                    'assets/images/logo1.png',
                    height: 80,
                  ),
                ),
                
                // Text that fades in as logo moves left
                Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 100), // Space for the logo
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Glam',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              height: 1.0,
                            ),
                          ),
                          Text(
                            'Connect',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}