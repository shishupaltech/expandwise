import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/screens/login_screen.dart';
import 'package:spendwise/widgets/hero_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLogoutLoading = false;
  logOut() async {
    setState(() {
      isLogoutLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    setState(() {
      isLogoutLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Hello, ', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon:
                isLogoutLoading
                    ? CircularProgressIndicator()
                    : Icon(Icons.exit_to_app, color: Colors.white),
          ),
        ],
      ),
      body: Container(
      
        width: double.infinity,
        child: Column(
          children: [
            HeroCard(),
            SizedBox(height: 20,),
            Padding(
              padding:  const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text('Recent Transactions',style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20))
                  
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}

