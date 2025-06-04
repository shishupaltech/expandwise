import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/utils/appvalidator.dart';
import 'package:spendwise/widgets/category_dropdown.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AddTransactionForm extends StatefulWidget {
  const AddTransactionForm({super.key});

  @override
  State<AddTransactionForm> createState() => _AddTransactionFormState();
}

class _AddTransactionFormState extends State<AddTransactionForm> {
  var type = "credit";
  var category = "Others";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  var isLoader = false;
  var appValidator = Appvalidator();
  var uid = Uuid();

  var amountEditController = TextEditingController();
  var titleEditController = TextEditingController();
  Future<void> _submitForm() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLoader = true;
      });

      final user = FirebaseAuth.instance.currentUser;
      int timestapm = DateTime.now().microsecondsSinceEpoch;
      var amount = int.parse(amountEditController.text);
      DateTime date = DateTime.now();

      var id = uid.v4();
      String monthyear = DateFormat('MMM y').format(date);

      final userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();

      int remainingAount = userDoc['remainingAount'];
      int totalCredit = userDoc['totalCredit'];
      int totalDebit = userDoc['totalDebit'];

      if (type == 'credit') {
        remainingAount += amount;
        totalCredit += amount;
      } else {
        remainingAount -= amount;
        totalDebit -= amount;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
            "remainingAount": remainingAount,
            "totalCredit": totalCredit,
            "totalDebit": totalDebit,
            "updateAt": timestapm,
          });

      var data = {
        'id': id,
        'title': titleEditController.text,
        'amount': amount,
        'type': type,
        'timestamp': timestapm,
        'totalCredit': totalCredit,
        'totalDebit': totalDebit,
        'remainingAount': remainingAount,
        'monthyear': monthyear,
        'category': category,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('transactions')
          .doc(id)
          .set(data);
      Navigator.pop(context);

      // print(data);
      // await authSerive.login(data, context);

      setState(() {
        isLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: titleEditController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appValidator.isEmptyCheck,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: amountEditController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: appValidator.isEmptyCheck,
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
            ElevatedButton(
              onPressed: () {
                if (isLoader == false) {
                  _submitForm();
                }
              },
              child:
                  isLoader
                      ? Center(child: CircularProgressIndicator())
                      : Text('Add Trasaction'),
            ),
          ],
        ),
      ),
    );
  }
}
