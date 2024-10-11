import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:uni/screens/favorite.dart';
import 'package:uni/screens/home/home_main.dart';
import 'package:uni/screens/profile.dart';
import 'package:uni/utils/colors.dart';
import 'package:uni/utils/dimensions.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Favorite fav;
  late MainHome home;
  late Profile profile;

  @override
  void initState() {
    home = MainHome();
    fav = Favorite();
    profile = Profile();
    pages = [home, fav, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: AppColors.inv,
        color: AppColors.sky,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          Icon(Icons.home, color: AppColors.navy),
          Icon(
            Icons.favorite,
            color: AppColors.navy,
          ),
          Icon(
            Icons.person,
            color: AppColors.navy,
          )
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
