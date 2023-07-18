import 'package:anime_ecommerce_app/screens/home/home.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_with_login.dart';
import 'package:anime_ecommerce_app/screens/profile/profile_without_login.dart';
import 'package:anime_ecommerce_app/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/colors.dart';
import '../constants/firebase_consts.dart';
import '../widgets/exit_dialog.dart';
import 'favrouits/favourits.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;

  late Widget _currentProfileScreen;

  @override
  void initState() {
    super.initState();
    _updateProfileScreen();
  }

  void _updateProfileScreen() {
    if (auth.currentUser == null) {
      _currentProfileScreen = const ProfileScreenWithoutLogin();
    } else {
      _currentProfileScreen = const ProfileWithLogin();
    }
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        _updateProfileScreen();
      }
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoruitsScreen(),
    ProfileScreenWithoutLogin(), // Placeholder, will be replaced dynamically
  ];

  @override
  Widget build(BuildContext context) {
    _pages[3] = _currentProfileScreen;

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          barrierDismissible: false,
          context: context, builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
              child: GNav(
                duration: const Duration(milliseconds: 200),
                haptic: true,
                iconSize: 24,
                rippleColor: const Color.fromARGB(255, 133, 58, 151),
                gap: 8,
                textSize: 24,
                selectedIndex: _selectedIndex,
                onTabChange: _navigateBottomBar,
                tabActiveBorder:
                    Border.all(color: const Color.fromARGB(255, 133, 58, 151)),
                backgroundColor: backgroundColor,
                color: const Color.fromARGB(255, 170, 166, 166),
                activeColor: const Color.fromARGB(255, 255, 254, 255),
                tabBackgroundColor: Colors.grey.shade800,
                padding: const EdgeInsets.all(16),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon: Icons.favorite_border,
                    text: 'Favourites',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
