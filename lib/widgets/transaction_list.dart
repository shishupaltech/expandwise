import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/widgets/transanction_card.dart';

class TransactionList extends StatelessWidget {
   TransactionList({super.key, required this.category, required this.type, required this.monthyear});
  final String category;
  final String type;
  final String monthyear;



  @override
  Widget build(BuildContext context) {
    final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null || currentUserId.isEmpty) {
      return Center(
        child: Text('No user is currently signed in.'),
      );
    }

    print('Category: $category');
    print('MonthYear: $monthyear');
    Query query = FirebaseFirestore.instance
      .collection('users')
      .doc(currentUserId)
      .collection('transactions')
      .orderBy('timestamp', descending: true)
      .where('monthyear', isEqualTo: monthyear)
      .where('type', isEqualTo: type);

    if (category != 'All') {
      query = query.where('category', isEqualTo: category);
    }

    return FutureBuilder<QuerySnapshot>(
      future: query.limit(150).get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }else if(snapshot.connectionState== ConnectionState.waiting){
          return Text('Loading');
        }else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
          return const Center(child: Text('No Transanctions found.'));
        }
        var data = snapshot.data!.docs;
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: NeverScrollableScrollPhysics(),

          itemBuilder: (context, index) {
            var cardData = data[index];
            return TransanctionCard(data: cardData);
          },
        );
      },
    );
  }
}