import 'package:flutter/material.dart';
import 'package:nike_app_vendors/app/views/screens/Add_Product_Screen/add_Product_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/my_Profile_Screen/my_profile_Screen.dart';
import 'package:nike_app_vendors/app/views/screens/reviews/reviews_Screen.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/perconal_Info_Screen/PerconalInfoScreen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomeScreen(),
    ReviewsScreen(),
    AddProductScreen(),
    MyProfileScreen(),
    PerconalInfoScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Add Product',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
