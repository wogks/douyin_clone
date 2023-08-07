import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('home'),
    ),
    const Center(
      child: Text('search'),
    ),
    const Center(
      child: Text('home'),
    ),
    const Center(
      child: Text('search'),
    ),
    const Center(
      child: Text('home'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            tooltip: 'what are you',
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
          ),
          BottomNavigationBarItem(
            tooltip: 'what are you',
            label: 'Search',
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
          BottomNavigationBarItem(
            tooltip: 'what are you',
            label: 'Search',
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
          BottomNavigationBarItem(
            tooltip: 'what are you',
            label: 'Search',
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
          BottomNavigationBarItem(
            tooltip: 'what are you',
            label: 'Search',
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
          ),
        ],
      ),
    );
  }
}
