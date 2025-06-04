import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/widgets/category_list.dart';
import 'package:spendwise/widgets/tab_bar_view.dart';
import 'package:spendwise/widgets/time_line_month.dart';

class TransanctionScreen extends StatefulWidget {
  TransanctionScreen({super.key });

  @override
  State<TransanctionScreen> createState() => _TransanctionScreenState();
}

class _TransanctionScreenState extends State<TransanctionScreen> {
   String category = 'All';

  String monthyear = DateFormat('MMM y').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansive')),
      body: Column(
        children:[
          TimeLineMonth(onChanged: (String? value) { 
            if(value != null){
              setState(() {
                monthyear=value;
              });
            }
           },),
          CategoryList(onChanged: (String? value) { 
            if(value != null){
              setState(() {
                category=value;
              });
            }
           },),
          TypeBarView(category:category, monthyear: monthyear,),
        ]
      ),
    );
  }
}
