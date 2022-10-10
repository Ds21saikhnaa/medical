import 'package:flutter/material.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/appointment.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/chat/chat.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/history.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/home.dart';
import 'package:medical_mobile/ui/screens/home_screen/pages/pro_file/pro_file.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  double _bottomPadding = 0.0;
  final ValueNotifier<PageController> _pageController =
      ValueNotifier(PageController());
  final List<Widget> _children = [
    const Home(),
    const Appointment(),
    const History(),
    const Chat(),
    const ProFile()
  ];
  void _onItemTapped(int index) {
    _selectedIndex.value = index;
    _pageController.value.animateToPage(
      _selectedIndex.value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    _bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _pageController,
        builder: (_, PageController value, __) {
          return PageView(
            controller: _pageController.value,
            children: _children,
            onPageChanged: (index) {
              _selectedIndex.value = index;
            },
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (_, int value, __) {
          return BottomNavigationBar(
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
            currentIndex: _selectedIndex.value,
            selectedItemColor: Colors.indigoAccent,
            onTap: _onItemTapped,
          );
        },
      ),
    );
  }
}
