class CommonValidations {
  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  static String? mobValidation(String? value) {
    if (value.toString().length != 10) {
      return 'Please enter a valid mobile number ';
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else if (value.toString().length < 6) {
      return 'Invalid Password';
    }
    return null;
  }

  static String? confirmPasswordValidation(
      String? value, String confirmPasswordControllerText) {
    if (value == null || value.isEmpty) {
      return 'Please enter password again';
    } else if (value != confirmPasswordControllerText) {
      return 'Password did not match';
    }
    return null;
  }
}
