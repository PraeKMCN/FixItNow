
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tes/admin/DashboardPage.dart';
import 'package:tes/login/login.dart';
import 'package:tes/profile/edit_profile.dart';
import 'package:tes/profile/profile.dart';

import 'package:tes/user/history.dart';
import 'package:tes/user/homescreen.dart';
import 'package:tes/user/historydetail.dart';
import 'package:tes/user/reportForm.dart';
class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int selectedPageIndex = 0;

  final List<Widget> _pages = [
   
   AdminPage()
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      
      body: SafeArea(
        child: _pages[selectedPageIndex],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        selectedIndex: selectedPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'หน้าหลัก',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book_outlined),
            label: 'ประวัติ',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'บัญชี',
          ),
        ],
      ),
    );
  }
}
