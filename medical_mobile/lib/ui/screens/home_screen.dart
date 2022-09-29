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
  double _bottomPadding = 0.0;
  final PageController _pageController = PageController();
  final List<IconData> _dummyData = [
    Icons.home,
    //Icons.note_add,
    Icons.calendar_month,
    Icons.history,
    Icons.chat,
    Icons.person,
  ];

  final List<String> _buttonName = [
    "home",
    "aptmnt",
    "history",
    "chat",
    "profile"
  ];
  final List<Widget> _children = [
    const Home(),
    const Appointment(),
    const History(),
    const Chat(),
    const ProFile()
  ];
  @override
  Widget build(BuildContext context) {
    _bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _children,
      ),
      bottomNavigationBar: _customNavigationBar(),
    );
  }

  Widget _customNavigationBar() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 80 + _bottomPadding,
      padding:
          EdgeInsets.only(bottom: _bottomPadding, top: _bottomPadding - 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _dummyData.asMap().entries.map((entry) {
          int idx = entry.key;
          IconData val = entry.value;
          String name = _buttonName[idx];

          return CustomNavigationItem(
            index: idx,
            iconData: val,
            onClickListener: (selectedIndex) async {
              _pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: name,
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationItem extends StatelessWidget {
  final int? index;
  final IconData? iconData;
  final Function(int)? onClickListener;
  final String text;

  const CustomNavigationItem({
    Key? key,
    this.index,
    this.iconData,
    this.onClickListener,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInkWell(
            onTap: () {
              if (onClickListener != null) onClickListener!(index ?? 0);
            },
            child: SizedBox(
              width: 48,
              height: 48,
              child: Column(
                children: [
                  Icon(
                    iconData,
                    color: Colors.black,
                    size: 28,
                  ),
                  Text(text),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
