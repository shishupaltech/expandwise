import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/widgets/add_transaction_form.dart';
import 'package:spendwise/widgets/hero_card.dart';
import 'package:spendwise/widgets/transactions_cards.dart';

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
    // Instead of pushing LoginScreen, just pop to root. AuthGate will handle navigation.
    Navigator.of(context).popUntil((route) => route.isFirst);
    setState(() {
      isLogoutLoading = false;
    });
  }

  _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: AddTransactionForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              title: Text('Hello, ', style: TextStyle(color: Colors.white)),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final currentUser = snapshot.data;
        if (currentUser == null || currentUser.uid.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              title: Text('Hello, ', style: TextStyle(color: Colors.white)),
            ),
            body: Center(child: Text('No user is currently signed in.')),
          );
        }
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue.shade900,
            onPressed: (() {
              _dialogBuilder(context);
            }),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue.shade900,
            title: Text('Hello, ', style: TextStyle(color: Colors.white)),
            actions: [
              IconButton(
                onPressed: () {
                  logOut();
                },
                icon: isLogoutLoading
                    ? CircularProgressIndicator()
                    : Icon(Icons.exit_to_app, color: Colors.white),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                  children: [HeroCard(), SizedBox(height: 20), TransactionsCards()]),
            ),
          ),
        );
      },
    );
  }
}
