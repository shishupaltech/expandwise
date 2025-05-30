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
  var isLogoutLoading = false;
  logOut() async{
    setState(() {
      isLogoutLoading=true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    setState(() {
      isLogoutLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(selectedIndex:currentIndex, onDestinationSelected: (int value){setState(() {
        currentIndex = value;
      });}),
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon:isLogoutLoading?CircularProgressIndicator():
           Icon(Icons.exit_to_app)),
        ],
      ),
      body: pageViewList[
        currentIndex
      ],
    );
  }
}