class Appvalidator {
  
  String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please Enter your Username';
    }
    return null;
  }

  String? validateEmail(value) {
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
  }

  String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Please Enter your phone';
    }
    if (value.length != 10) {
      return 'Please Enter a 10 digit number';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please Enter your password';
    }
    return null;
  }

  String? validateConfirmPassword(value) {
    if (value!.isEmpty) {
      return 'Please Enter your confirm password..';
    }
    return null;
  }

}
