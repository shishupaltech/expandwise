
import 'package:flutter/material.dart';
import 'package:spendwise/widgets/category_dropdown.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  var type = "credit";
  var category = "Others";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(decoration: InputDecoration(labelText: 'Title')),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'amount'),
            ),
            CategoryDropdown(
              cattype: category,
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    category = value;
                  });
                }
              },
            ),

            DropdownButtonFormField(
              value: 'credit',
              items: [
                DropdownMenuItem(child: Text('Credit'), value: 'credit'),
                DropdownMenuItem(child: Text('Debit'), value: 'debit'),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    type = value;
                  });
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Add Trasaction')),
          ],
        ),
      ),
    );
  }
}
