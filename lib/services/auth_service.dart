import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      print('User created: \\${credential.user?.uid}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User Created Successfully'))
      );
      await db.addUser(data, context);
      // Instead of navigating to Dashboard, just pop to root. AuthGate will handle navigation.
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException code: \\${e.code}');
      print('FirebaseAuthException message: \\${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: \\${e.message}')),
      );
      
    } catch (e) {
      print('Unknown error: \\${e}');
    }
  }

  login(data,context) async {
   try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      print('Login successful: \\${credential.user?.uid}');
      print('Current user after login: \\${FirebaseAuth.instance.currentUser}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
      // Instead of navigating to Dashboard, just pop to root. AuthGate will handle navigation.
      Navigator.of(context).popUntil((route) => route.isFirst);
      // TODO: AuthGate will show Dashboard automatically.
    }catch(e){
      print(e);
    }
  }
}
