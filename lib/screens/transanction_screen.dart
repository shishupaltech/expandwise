import 'package:flutter/material.dart';
import 'package:spendwise/widgets/category_list.dart';
import 'package:spendwise/widgets/time_line_month.dart';

class TransanctionScreen extends StatelessWidget {
  const TransanctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansive')),
      body: Column(
        children:[
          TimeLineMonth(onChanged: (String? value) {  },),
          CategoryList(onChanged: (String? value) {  },),
        ]
      ),
    );
  }
}
