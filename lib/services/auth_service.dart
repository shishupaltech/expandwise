import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  createUser(data, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: data['email'],
            password: data['password'],
          );
    } catch (e) {
      print(e);
    }
  }
}
