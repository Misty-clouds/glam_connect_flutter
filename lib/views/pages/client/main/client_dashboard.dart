import 'package:flutter/material.dart';
import 'package:glam_connect/views/pages/client/home/home.dart';
import 'package:glam_connect/views/pages/client/search.dart';
import 'package:glam_connect/views/pages/client/bookings.dart';
import 'package:glam_connect/views/pages/client/messages.dart';
import 'package:glam_connect/views/pages/client/profile.dart';
import 'package:glam_connect/views/widgets/client/client_navbar.dart';

class ClientDashboard extends StatefulWidget {
  final int initialIndex;
  const ClientDashboard({super.key, this.initialIndex = 0});

  @override
  State<ClientDashboard> createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    ClientHomePage(),
    ClientSearchPage(),
    ClientBookingsPage(),
    ClientMessagesPage(),
    ClientProfilePage(),
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
      bottomNavigationBar: ClientNavbar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
