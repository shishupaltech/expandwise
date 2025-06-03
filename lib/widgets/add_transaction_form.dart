import 'package:flutter/material.dart';

class AddTransactionForm extends StatelessWidget {
  const AddTransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Title',

            ),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'amount',
              
            ),
          ),
          DropdownButtonFormField(items:[
            DropdownMenuItem(child: Text('Credit'),value: 'credit',),
            DropdownMenuItem(child: Text('Debit'),value: 'debit',),
          ], onChanged: (value){
            
          })
        ],
      ),
    );
  }
}