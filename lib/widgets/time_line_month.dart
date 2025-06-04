import 'package:flutter/material.dart';

class TimeLineMonth extends StatelessWidget {
  const TimeLineMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
        itemCount: 12,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 80, 
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),

            ),
            child: Center(child: Text('Oct 2021'))
          );
        },
      ),
    );
  }
}
