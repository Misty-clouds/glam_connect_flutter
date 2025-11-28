import 'package:flutter/material.dart';
import 'package:glam_connect/constants/styles/app_colors.dart';

class ArtistNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const ArtistNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.beige,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.grey3,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.description_outlined),
          ),
          activeIcon: Badge(
            label: Text('2'),
            child: Icon(Icons.description),
          ),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          activeIcon: Icon(Icons.account_balance_wallet),
          label: 'Earnings',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.chat_bubble_outline),
          ),
          activeIcon: Badge(
            label: Text('2'),
            child: Icon(Icons.chat_bubble),
          ),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}