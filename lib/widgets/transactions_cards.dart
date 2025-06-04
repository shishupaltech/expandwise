import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/utils/icons_list.dart';
import 'package:spendwise/widgets/transanction_card.dart';

class TransactionsCards extends StatelessWidget {
  const TransactionsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RecentTransanctionList(),
        ],
      ),
    );
  }
}

class RecentTransanctionList extends StatelessWidget {
   RecentTransanctionList({super.key});

  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(userId).collection('transactions').snapshots(),
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
          itemCount: 2,
          physics: NeverScrollableScrollPhysics(),

          itemBuilder: (context, index) {
            return TransanctionCard(data: data);
          },
        );
      },
    );
  }
}

