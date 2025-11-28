import 'package:flutter/material.dart';
import 'package:glam_connect/views/pages/model/home.dart';
import 'package:glam_connect/views/pages/model/browse.dart';
import 'package:glam_connect/views/pages/model/applications.dart';
import 'package:glam_connect/views/pages/model/messages.dart';
import 'package:glam_connect/views/pages/model/profile.dart';
import 'package:glam_connect/views/widgets/model/model_navbar.dart';

class ModelDashboard extends StatefulWidget {
  final int initialIndex;
  const ModelDashboard({super.key, this.initialIndex = 0});

  @override
  State<ModelDashboard> createState() => _ModelDashboardState();
}

class _ModelDashboardState extends State<ModelDashboard> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    ModelHomePage(),
    ModelBrowsePage(),
    ModelApplicationsPage(),
    ModelMessagesPage(),
    ModelProfilePage(),
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
      bottomNavigationBar: ModelNavbar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
