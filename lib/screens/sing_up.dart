import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20.0,),
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
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  fillColor: const Color.fromARGB(255, 167, 180, 211),
                  filled: true,
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 9, 28, 44),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  suffix: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor: const Color.fromARGB(255, 167, 180, 211),
                  filled: true,
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 9, 28, 44),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  suffix: Icon(
                    Icons.email,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your email';
                  }
                  RegExp emailRegExp = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Enter your valie Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  fillColor: const Color.fromARGB(255, 167, 180, 211),
                  filled: true,
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 9, 28, 44),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  suffix: Icon(
                    Icons.call,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your phone';
                  }
                  if (value.length != 10) {
                    return 'Please Enter a 10 digit number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: const Color.fromARGB(255, 167, 180, 211),
                  filled: true,
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 9, 28, 44),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  suffix: Icon(
                    Icons.lock,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  fillColor: const Color.fromARGB(255, 167, 180, 211),
                  filled: true,
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 9, 28, 44),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),

                  suffix: Icon(
                    Icons.lock,
                    color: const Color.fromARGB(255, 7, 7, 7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter your confirm password..';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 3, 17, 18)),
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
                      fontSize: 25
                    ),
                  ),
                ),
                
              ),
                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  
                }, child: 
                Text('Login',style: TextStyle(color: const Color.fromARGB(255, 3, 17, 18),fontSize: 28),))
            ],
          ),
        ),
      ),
    );
  }
}
