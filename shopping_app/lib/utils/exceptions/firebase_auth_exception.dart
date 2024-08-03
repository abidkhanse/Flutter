class TFirebaseAuthException implements Exception {
  String code = "error";

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case "email-already-in-use":
        return "This email is already in use.";
      case "invalid-email":
        return "The email address is invalid. Provide a valid email address.";
      case "weak-password":
        return "The password is too weak. It should be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, and one number.";
      case "user-not-found":
        return "No user found for that email.";
      case "wrong-password":
        return "Incorrect password provided.";
      case "user-disabled":
        return "This user has been disabled. Please contact support for help.";
      case "operation-not-allowed":
        return "This operation is not allowed. Please contact support.";
      case "too-many-requests":
        return "Too many requests. Please try again later.";
      case "invalid-verification-code":
        return "The verification code is invalid.";
      case "invalid-verification-id":
        return "The verification ID is invalid.";
      case "account-exists-with-different-credential":
        return "An account already exists with a different credential.";
      case "invalid-credential":
        return "The credential is invalid. Please try again.";
      case "credential-already-in-use":
        return "This credential is already in use.";
      case "invalid-phone-number":
        return "The phone number is invalid. Please enter a valid phone number.";
      case "missing-verification-code":
        return "The verification code is missing.";
      case "missing-verification-id":
        return "The verification ID is missing.";
      case "session-expired":
        return "The session has expired. Please try again.";
      case "quota-exceeded":
        return "The quota for this operation has been exceeded. Please try again later.";
      case "app-not-authorized":
        return "This app is not authorized to use Firebase Authentication.";
      case "network-request-failed":
        return "A network error occurred. Please check your internet connection and try again.";
      case "requires-recent-login":
        return "This operation requires a recent login. Please log in again and try again.";
      default:
        return "An unknown error occurred. Please try again later.";
    }
  }
}
