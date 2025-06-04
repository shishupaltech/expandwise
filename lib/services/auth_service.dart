import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/screens/dashboard.dart';
import 'package:spendwise/services/db.dart';

class AuthService {
  var db = Db();
  createUser(data, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      print('User created: ${credential.user?.uid}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User Created Successfully'))
      );
      await db.addUser(data, context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException code: ${e.code}');
      print('FirebaseAuthException message: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
      
    } catch (e) {
      print('Unknown error: $e');
    }
  }

  login(data,context) async {
   try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );

      print('Login successful: ${credential.user?.uid}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
      
      // TODO: Navigate to home screen or dashboard here.
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    }catch(e){
      print(e);
    }
  }
}
