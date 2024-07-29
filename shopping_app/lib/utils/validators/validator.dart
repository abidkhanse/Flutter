class TValidator {
  TValidator._();

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return 'The $fieldName field is required';
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'E-mail is required';
    }

    final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegEx.hasMatch(email)) {
      return 'invalid e-mail address';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must have at least 1 upper case letter';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must have at least 1 digit';
    }

    if (!password.contains(RegExp(r'[!@#$^&*(),.?":{}|<>]'))) {
      return 'Password must have at least 1 special character';
    }

    return null;
  }

  static String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'Phone is required';
    }

    final phoneRegEx = RegExp(r'^\d(10)$');

    if (phoneRegEx.hasMatch(phone)) {
      return 'invalid phone number format , 10 digits at least';
    }

    return null;
  }
}
