import 'dart:ui';
import 'package:flutter/material.dart';
import '/constants/styles/index.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _pageFraction = 0.0;
  late AnimationController _contentController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Find Your Perfect Match',
      description:
          'Browse hundreds of talented makeup artists in your area. From bridal glam to everyday beauty.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding2.png',
      title: 'Book in Seconds',
      description:
          'Choose your artist, pick a time, and secure your booking instantly. No hassle.',
    ),
    OnboardingPage(
      image: 'assets/images/onboarding3.png',
      title: 'Relax, We\'ve Got You',
      description:
          'Verified artists, secure payments, and 24/7 support. Your beauty experience, perfected.',
      isLast: true,
    ),
  ];
  late int lastPage = _pages.length-1;

  @override
  void initState() {
    super.initState();
    
    // Content animation controller for text fade and slide
    _contentController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: Curves.easeOutCubic,
      ),
    );

    // Start initial animation
    _contentController.forward();

    // Listen to page changes for blur effect
    _pageController.addListener(() {
      setState(() {
        _pageFraction = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _animateContent() {
    _contentController.reset();
    _contentController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.plum,
      body: Stack(
        children: [
          // PageView with images and content
          PageView.builder(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
              _animateContent();
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _buildPage(_pages[index], index);
            },
          ),

          // Page indicator
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: WormEffect(
                  dotColor:  _currentPage == lastPage ? Colors.transparent : Colors.white.withValues(alpha: 0.3),
                  activeDotColor: _currentPage == lastPage ? Colors.transparent : Colors.white,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
              ),
            ),
          ),

          // Bottom button with animated entrance
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.5),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: _currentPage == _pages.length - 1
                        ? SizedBox(
                            key: const ValueKey('button'),
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                //Navigate to role selection Page
                                context.go('/role');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.9),
                                foregroundColor: AppColors.plum,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 8,
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(
                            key: ValueKey('empty'),
                            height: 56,
                          ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(OnboardingPage page, int index) {
    // Calculate blur amount based on page offset
    double pageOffset = 0.0;
    if (_pageController.hasClients) {
      pageOffset = (_pageFraction - index).clamp(-1.0, 1.0);
    }
    double blurAmount = pageOffset.abs() * 10;
    double fadeAmount = pageOffset.abs();

    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image with conditional blur
        Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              page.image,
              fit: BoxFit.cover,
            ),
            // Apply blur when page is transitioning
            if (blurAmount > 0)
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: blurAmount,
                  sigmaY: blurAmount,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            // Fade overlay to mask the edge between pages
            if (fadeAmount > 0)
              Container(
                color: AppColors.plum.withOpacity(fadeAmount * 0.3),
              ),
          ],
        ),

        // Fixed gradient overlay (doesn't move with navigation)
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withValues(alpha: 0.3),
                AppColors.plum.withValues(alpha: 0.95),
              ],
              stops: const [0.0, 0.5, 0.85],
            ),
          ),
        ),

        // Content with text animation only
        Positioned(
          bottom: 150,
          left: 32,
          right: 32,
          child: AnimatedBuilder(
            animation: _contentController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        page.title,
                        style: AppTextStyles.h5(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page.description,
                        style: AppTextStyles.body1(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class OnboardingPage {
  final String image;
  final String title;
  final String description;
  final bool isLast;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
    this.isLast = false,
  });
}
