import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  logOut() async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Text('Hello'),
    );
  }
}