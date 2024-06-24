import 'package:ecommerceapp/core/app_colors.dart';
import 'package:ecommerceapp/feutures/home/view/card_view.dart';
import 'package:ecommerceapp/feutures/home/view/home_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeView(),
    const CardView(),
  ];
  Color activeC = darkC;
  Color inActiveC = offLightC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: darkC,
        unselectedItemColor: offLightC,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopify), label: 'Card', tooltip: 'card'),
        ],
        onTap: (value) {
          setState(() {
            pageIndex = value;
            // if (value == 0) {
            //   activeC = darkC;
            //   inActiveC = primaryC;
            // } else {
            //   activeC = primaryC;
            //   inActiveC = darkC;
            // }
          });
        },
      ),
      body: pages[pageIndex],
    );
  }
}
