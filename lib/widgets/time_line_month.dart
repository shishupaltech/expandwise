import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeLineMonth extends StatefulWidget {
  const TimeLineMonth({super.key});

  @override
  State<TimeLineMonth> createState() => _TimeLineMonthState();
}

class _TimeLineMonthState extends State<TimeLineMonth> {
  String currentMonth = "";
  List<String> months = [];

  @override
  void initState(){
    super.initState();
    DateTime now = DateTime.now();
    for(int i=-18;i<=0;i++){
      months.add(
        DateFormat('MMM y').format(DateTime(now.year,now.month+i,1)),
      );
    }
    currentMonth = DateFormat('MMM Y').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        itemCount: months.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 80, 
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),

            ),
            child: Center(child: Text(months[index])),
          );
        },
      ),
    );
  }
}
