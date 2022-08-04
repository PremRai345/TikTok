import 'package:flutter/material.dart';

import 'package:tiktok/constant.dart';
import 'package:tiktok/view/widgets/custom_add_icon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageidx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        onTap: (index) {
          setState(() {
            pageidx = index;
          });
        },
        currentIndex: pageidx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, size: 25),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: customAddIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined, size: 25),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 25),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(
        child: Text(pageindex[pageidx]),
      ),
    );
  }
}
