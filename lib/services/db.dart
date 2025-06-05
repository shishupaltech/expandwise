import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Db {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUser(data,context) async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null || currentUser.uid.isEmpty) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Signup Failed'),
          content: Text('No user is currently signed in.'),
        );
      },
    );
    return;
  }
  final userId = currentUser.uid;
  await users
    .doc(userId)
    .set(data)
    .then((value) => print("User Added"))
    .catchError((error){
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text('Signup Failed'),
            content: Text(error.toString()),
          );
        }
      );
    });
  }
}