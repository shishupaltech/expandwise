import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HeroCard extends StatelessWidget {
   HeroCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (currentUserId.isEmpty) {
      return const Text('No user is currently signed in.');
    }
    final Stream<DocumentSnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').doc(currentUserId).snapshots();
     return StreamBuilder<DocumentSnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if(!snapshot.hasData || !snapshot.data!.exists){
          return const Text('Document does not exist');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        var data = snapshot.data!.data() as Map<String,dynamic>;

        return Cards(data: data,);
      },
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    super.key, required this.data,
  });
  final Map data;
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
                  '₹ ${data['remainingAount']}',
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
                CardOne(color: Colors.green, heading: 'Credit', amount:  '${data['totalCredit']}',),
                SizedBox(width: 10),
                CardOne(color: Colors.red, heading: 'Debit', amount:  '${data['totalDebit']}',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({super.key, required this.color, required this.heading, required this.amount});

  final Color color;
  final String heading;
  final String amount;
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
                  Text(heading, style: TextStyle(color: color, fontSize: 30)),
                  Text(
                    '₹ ${amount}',
                    style: TextStyle(
                      color: color,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(

                padding: EdgeInsets.all(8.0),
                child: Icon(
                  heading=='Credit'?Icons.arrow_upward_outlined:Icons.arrow_downward_outlined 
                  , color: color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
