import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/utils/icons_list.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});
 
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding:const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Text('Recent Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              
              )
            ],
          ),
          RecentTransanctionList(),
        ],
      ),
    );
  }
}

class RecentTransanctionList extends StatelessWidget {
  const RecentTransanctionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      physics: NeverScrollableScrollPhysics(),
    
      itemBuilder: (context, index){
      
      return TransanctionCard();
    });
  }
}

class TransanctionCard extends StatelessWidget {
  TransanctionCard({
    super.key,
    
  });
  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset:Offset(0,10),
              color: Colors.grey.withOpacity(0.09),
              blurRadius: 10.0,
              spreadRadius: 4.0,
              
            
            )
          ]
        ),
        child: ListTile(
          minVerticalPadding: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
          leading: Container(
            width: 70,
            height:100,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green.withOpacity(0.2),
            
              ),
              child: Center(child: FaIcon(appIcons.getExpenseCategoryIcons('Rent'))),
            ),
          ),
          title: Row(
            children: [
              Expanded(child: Text('Card Rent Oct 2023')),
              Text('₹ 8000',style: TextStyle(color: Colors.green),)
            ],
        
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Balance",style: TextStyle(color: Colors.grey,fontSize: 13)),
                  Spacer(),
                  Text('₹ 525', style: TextStyle(color: Colors.grey,fontSize: 13),),
        
        
                ],
              ),
              Text('25 oct 4:51 PM',style: TextStyle(color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}