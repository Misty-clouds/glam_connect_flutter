import 'package:glam_connect/auth/pages/auth_gate.dart';
import 'package:glam_connect/auth/pages/sign_up/sign_up.dart';
import 'package:glam_connect/auth/pages/artist_payment_flow/subscription.dart';
import 'package:glam_connect/auth/pages/artist_payment_flow/review_and_pay.dart';
import 'package:glam_connect/auth/pages/artist_payment_flow/payment_processing.dart';
import 'package:glam_connect/auth/pages/artist_payment_flow/payment_error.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/create_profile.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/select_services.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/set_pricing.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/showcase_work.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/availability.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/verify_certificate.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/review_profile.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/under_review.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/approved.dart';
import 'package:glam_connect/auth/pages/onboarding2/artist/needs_more_info.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/create_profile.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/experience_interest.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/showcase.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/physical_details.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/review_profile.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/under_review.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/approved.dart';
import 'package:glam_connect/auth/pages/onboarding2/model/needs_more_info.dart';
import 'package:glam_connect/auth/pages/login/login.dart';
import 'package:glam_connect/auth/pages/reset_password/reset_password.dart';
import 'package:glam_connect/auth/pages/reset_password/enter_otp.dart';
import 'package:glam_connect/auth/pages/reset_password/new_password.dart';
import 'package:glam_connect/auth/pages/reset_password/password_success.dart';
import 'package:glam_connect/views/pages/artist/main/artist_dashboard.dart';
import 'package:glam_connect/views/pages/client/home/categories.dart';
import 'package:glam_connect/views/pages/client/home/categories_details.dart';
import 'package:glam_connect/views/pages/client/main/client_dashboard.dart';
import 'package:glam_connect/views/pages/model/main/model_dashboard.dart';
import 'package:glam_connect/views/pages/shared/onboarding/role_selection.dart';
import 'package:glam_connect/views/pages/shared/onboarding/splash_screen.dart';
import 'package:glam_connect/views/pages/shared/onboarding/onboarding_view.dart';
import 'package:glam_connect/views/pages/client/home/home.dart';
import 'package:glam_connect/views/pages/client/search.dart';
import 'package:glam_connect/views/pages/client/bookings.dart';
import 'package:glam_connect/views/pages/client/messages.dart';
import 'package:glam_connect/views/pages/client/profile.dart';
import 'package:glam_connect/views/pages/artist/home.dart';
import 'package:glam_connect/views/pages/artist/bookings.dart';
import 'package:glam_connect/views/pages/artist/earnings.dart';
import 'package:glam_connect/views/pages/artist/messages.dart';
import 'package:glam_connect/views/pages/artist/profile.dart';
import 'package:glam_connect/views/pages/model/home.dart';
import 'package:glam_connect/views/pages/model/browse.dart';
import 'package:glam_connect/views/pages/model/applications.dart';
import 'package:glam_connect/views/pages/model/messages.dart';
import 'package:glam_connect/views/pages/model/profile.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/onboarding', builder: (context, state) => OnboardingView()),
    GoRoute(path: '/role', builder: (context, state) => RoleSelectionPage()),
    GoRoute(path: '/signup', builder: (context, state) => SignUp()),
    GoRoute(path: '/auth', builder: (context, state) => AuthGate()),
    GoRoute(path: '/login', builder: (context, state) => Login()),
    // Reset password flow
    GoRoute(path: '/reset-password', builder: (context, state) => ResetPassword()),
    GoRoute(path: '/reset-password/enter-otp', builder: (context, state) => EnterOTP()),
    GoRoute(path: '/reset-password/new-password', builder: (context, state) => NewPassword()),
    GoRoute(path: '/reset-password/success', builder: (context, state) => PasswordUpdateSuccess()),
    // Client routes
    GoRoute(
      path: '/client/dashboard',
      builder: (context, state) {
        final index = int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;
        return ClientDashboard(initialIndex: index);
      },
    ),
    GoRoute(
      path: '/client/home',
      builder: (context, state) => ClientHomePage(),
    ),
    GoRoute(
      path: '/client/search',
      builder: (context, state) => ClientSearchPage(),
    ),
    GoRoute(
      path: '/client/bookings',
      builder: (context, state) => ClientBookingsPage(),
    ),
    GoRoute(
      path: '/client/messages',
      builder: (context, state) => ClientMessagesPage(),
    ),
    GoRoute(
      path: '/client/profile',
      builder: (context, state) => ClientProfilePage(),
    ),
    // Artist routes
    GoRoute(
      path: '/artist/dashboard',
      builder: (context, state) {
        final index = int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;
        return ArtistDashboard(initialIndex: index);
      },
    ),
    GoRoute(
      path: '/artist/home',
      builder: (context, state) => ArtistHomePage(),
    ),
    GoRoute(
      path: '/artist/bookings',
      builder: (context, state) => ArtistBookingsPage(),
    ),
    GoRoute(
      path: '/artist/earnings',
      builder: (context, state) => ArtistEarningsPage(),
    ),
    GoRoute(
      path: '/artist/messages',
      builder: (context, state) => ArtistMessagesPage(),
    ),
    GoRoute(
      path: '/artist/profile',
      builder: (context, state) => ArtistProfilePage(),
    ),
    // Artist subscription flow
    GoRoute(
      path: '/artist/subscription',
      builder: (context, state) => ArtistSubscription(),
    ),
    GoRoute(
      path: '/artist/subscription/review',
      builder: (context, state) => ReviewAndPay(),
    ),
    GoRoute(
      path: '/artist/subscription/processing',
      builder: (context, state) => PaymentProcessing(),
    ),
    GoRoute(
      path: '/artist/subscription/error',
      builder: (context, state) => PaymentError(),
    ),
    // Artist onboarding routes
    GoRoute(
      path: '/artist/onboarding/create-profile',
      builder: (context, state) => ArtistCreateProfile(),
    ),
    GoRoute(
      path: '/artist/onboarding/select-services',
      builder: (context, state) => ArtistSelectServices(),
    ),
    GoRoute(
      path: '/artist/onboarding/set-pricing',
      builder: (context, state) => ArtistSetPricing(),
    ),
    GoRoute(
      path: '/artist/onboarding/showcase-work',
      builder: (context, state) => ArtistShowcaseWork(),
    ),
    GoRoute(
      path: '/artist/onboarding/availability',
      builder: (context, state) => ArtistAvailability(),
    ),
    GoRoute(
      path: '/artist/onboarding/verify-certificate',
      builder: (context, state) => ArtistVerifyCertificate(),
    ),
    GoRoute(
      path: '/artist/onboarding/review',
      builder: (context, state) => ArtistReviewProfile(),
    ),
    // Artist onboarding status routes
    GoRoute(
      path: '/artist/onboarding/under-review',
      builder: (context, state) => UnderReview(),
    ),
    GoRoute(
      path: '/artist/onboarding/approved',
      builder: (context, state) => Approved(),
    ),
    GoRoute(
      path: '/artist/onboarding/needs-more-info',
      builder: (context, state) => NeedsMoreInfo(),
    ),
    // Model routes
    GoRoute(
      path: '/model/dashboard',
      builder: (context, state) {
        final index = int.tryParse(state.uri.queryParameters['index'] ?? '0') ?? 0;
        return ModelDashboard(initialIndex: index);
      },
    ),
    GoRoute(path: '/model/home', builder: (context, state) => ModelHomePage()),
    GoRoute(
      path: '/model/browse',
      builder: (context, state) => ModelBrowsePage(),
    ),
    GoRoute(
      path: '/model/applications',
      builder: (context, state) => ModelApplicationsPage(),
    ),
    GoRoute(
      path: '/model/messages',
      builder: (context, state) => ModelMessagesPage(),
    ),
    GoRoute(
      path: '/model/profile',
      builder: (context, state) => ModelProfilePage(),
    ),
    // Model onboarding routes
    GoRoute(
      path: '/model/onboarding/create-profile',
      builder: (context, state) => ModelCreateProfile(),
    ),
    GoRoute(
      path: '/model/onboarding/experience-interest',
      builder: (context, state) => ModelExperienceInterest(),
    ),
    GoRoute(
      path: '/model/onboarding/showcase',
      builder: (context, state) => ModelShowcase(),
    ),
    GoRoute(
      path: '/model/onboarding/physical-details',
      builder: (context, state) => ModelPhysicalDetails(),
    ),
    GoRoute(
      path: '/model/onboarding/review',
      builder: (context, state) => ModelReviewProfile(),
    ),
    // Model onboarding status routes
    GoRoute(
      path: '/model/onboarding/under-review',
      builder: (context, state) => ModelUnderReview(),
    ),
    GoRoute(
      path: '/model/onboarding/approved',
      builder: (context, state) => ModelApproved(),
    ),
    GoRoute(
      path: '/model/onboarding/needs-more-info',
      builder: (context, state) => ModelNeedsMoreInfo(),
    ),
     GoRoute(
      path: '/client/categories/details',
      builder: (context, state) => CategoriesDetails(),
    ),
      GoRoute(
      path: '/client/categories',
      builder: (context, state) => Categories(),
    ),
  ],
);
