import 'package:first_flutter_project/screens/home_screen.dart';
import 'package:first_flutter_project/screens/profile_screen.dart';
import 'package:first_flutter_project/screens/search_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  static final List <Widget> widgetsList = <Widget> [
    const HomeScreen(),
    const SearchScreen() ,
    const ProfileScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
          child: widgetsList[selectedIndex]
      ),

      bottomNavigationBar: BottomNavigationBar (

        currentIndex: selectedIndex,
        onTap: onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.brown,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],

      ),
    );
  }
}
