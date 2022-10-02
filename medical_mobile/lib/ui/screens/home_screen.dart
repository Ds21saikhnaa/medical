import 'package:flutter/material.dart';
import 'package:medical_mobile/ui/pages/appointment.dart';
import 'package:medical_mobile/ui/pages/chat.dart';
import 'package:medical_mobile/ui/pages/history.dart';
import 'package:medical_mobile/ui/pages/pro_file.dart';

import '../../customs/custom_inkwell.dart';
import '../pages/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  double _bottomPadding = 0.0;
  final PageController _pageController = PageController();
  final List<Widget> _children = [
    const Home(),
    const Appointment(),
    const History(),
    const Chat(),
    const ProFile()
  ];
  void _onItemTapped(int index) {
    setState(() {});
    _selectedIndex = index;
    _pageController.animateToPage(
      _selectedIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  Widget build(BuildContext context) {
    _bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _children,
        onPageChanged: (index) {
          setState(() {});
          _selectedIndex = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigoAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
