import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/utils/icons_list.dart';

// ignore: must_be_immutable
class TransanctionCard extends StatelessWidget {
  TransanctionCard({super.key,required this.data});
  final dynamic data;
  var appIcons = AppIcons();

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(data['timestamp']);
    String formatedDate = DateFormat('d MMM hh:mma').format(date);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              color: Colors.grey.withOpacity(0.09),
              blurRadius: 10.0,
              spreadRadius: 4.0,
            ),
          ],
        ),
        child: ListTile(
          minVerticalPadding: 10,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          leading: Container(
            width: 70,
            height: 100,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:data['type']=='credit'?
                 Colors.green.withOpacity(0.2):Colors.red.withOpacity(0.2),
              ),
              child: Center(
                child: FaIcon(appIcons.getExpenseCategoryIcons('${data['category']}'),
                color:data['type']=='credit'
                ? Colors.green
                :Colors.red,
              ),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(child: Text('${data['title']}')),
              Text("${data['type']=='credit'?'+':'-'} ₹${data['amount']}", 
               style: TextStyle(
                color:data['type']=='credit'
                ? Colors.green
                :Colors.red,
                )
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Balance",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Spacer(),
                  Text(
                    '₹  ${data['remainingAount']}',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
              Text(formatedDate, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
