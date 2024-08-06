import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:penjualanku/screens/home/Search.dart';
import 'package:penjualanku/screens/home/home_screen.dart';
import 'package:penjualanku/screens/home/profile.dart';

class Navigasi extends StatefulWidget {
  const Navigasi({super.key});

  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(), // Halaman Home
    // const Barcode(), // Halaman Barcode
    const Search(), // Halaman Search
    const Profile()
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose(); // Penting untuk mencegah kebocoran memori
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: _widgetOptions,
        onPageChanged: (index) {
          if (_selectedIndex != index) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: FaIcon(FontAwesomeIcons.barcode),
          //   label: 'Barcode',
          // ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
