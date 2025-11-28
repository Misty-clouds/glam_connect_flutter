import 'package:flutter/material.dart';
import 'package:glam_connect/views/pages/artist/home.dart';
import 'package:glam_connect/views/pages/artist/bookings.dart';
import 'package:glam_connect/views/pages/artist/earnings.dart';
import 'package:glam_connect/views/pages/artist/messages.dart';
import 'package:glam_connect/views/pages/artist/profile.dart';
import 'package:glam_connect/views/widgets/artist/artist_navbar.dart';

class ArtistDashboard extends StatefulWidget {
  final int initialIndex;
  const ArtistDashboard({super.key, this.initialIndex = 0});

  @override
  State<ArtistDashboard> createState() => _ArtistDashboardState();
}

class _ArtistDashboardState extends State<ArtistDashboard> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    ArtistHomePage(),
    ArtistBookingsPage(),
    ArtistEarningsPage(),
    ArtistMessagesPage(),
    ArtistProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: ArtistNavbar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}