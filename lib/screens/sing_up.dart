import 'package:flutter/material.dart';
import 'package:spendwise/utils/appvalidator.dart';

class SingUp extends StatelessWidget {
  SingUp({super.key});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  void _submitForm() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(_formkey.currentContext!).showSnackBar(
        const SnackBar(content: Text('Form successfully submitted!..')),
      );
    }
  }
  var appvalidator = Appvalidator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Create New Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: _buildInputDecoration('Username', Icons.person),
                validator:appvalidator.validateUsername,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: _buildInputDecoration('Email', Icons.email),
                validator:appvalidator.validateEmail,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: _buildInputDecoration('Phone Number', Icons.call),
                validator:appvalidator.validatePhoneNumber,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: _buildInputDecoration('Password', Icons.lock),
                validator:appvalidator.validatePassword,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _buildInputDecoration(
                  'Confirm Password',
                  Icons.lock,
                ),
                validator:appvalidator.validateConfirmPassword,
              ),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 3, 17, 18),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    elevation: WidgetStateProperty.all(4),
                  ),

                  child: Text(
                    'Create',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 3, 17, 18),
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData suffixicon) {
    return InputDecoration(
      labelText: label,
      fillColor: const Color.fromARGB(255, 167, 180, 211),
      filled: true,
      labelStyle: TextStyle(color: const Color.fromARGB(255, 9, 28, 44)),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),

      suffix: Icon(suffixicon, color: const Color.fromARGB(255, 7, 7, 7)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
