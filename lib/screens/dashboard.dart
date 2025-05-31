import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/screens/home_screen.dart';
import 'package:spendwise/screens/login_screen.dart';
import 'package:spendwise/screens/transanction_screen.dart';
import 'package:spendwise/widgets/navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  var pageViewList = [
    HomeScreen(),
    TransanctionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex:currentIndex, onDestinationSelected: (int value){setState(() {
        currentIndex = value;
      });}),
      
      body: pageViewList[
        currentIndex
      ],
    );
  }
}