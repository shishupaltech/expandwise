import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon:isLogoutLoading?CircularProgressIndicator():
           Icon(Icons.exit_to_app)),
        ],
      ),
      body: Text('Home Screen Page'),
    );
  }
}