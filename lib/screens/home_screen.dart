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

class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade900,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₹ 5800988',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                CardOne(color: Colors.green),
                SizedBox(width: 10),
                CardOne(color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Credit', style: TextStyle(color: color, fontSize: 30,)),
                  Text('₹58000', style: TextStyle(color: color, fontSize: 30,fontWeight: FontWeight.w600)),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_upward_outlined,color: color,)
              ),
            ],
             
          ),
        ),
      ),
    );
  }
}
