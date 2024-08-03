class TFirebaseException implements Exception {
  String code = "error";

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case "already-exists":
        return "The requested resource already exists.";
      case "cancelled":
        return "The operation was cancelled.";
      case "data-loss":
        return "Data loss occurred.";
      case "deadline-exceeded":
        return "The operation took too long to complete.";
      case "failed-precondition":
        return "Operation was rejected due to failed preconditions.";
      case "internal":
        return "An internal error occurred.";
      case "invalid-argument":
        return "Invalid argument provided.";
      case "not-found":
        return "The requested resource was not found.";
      case "out-of-range":
        return "The operation was attempted past the valid range.";
      case "permission-denied":
        return "You do not have permission to perform this operation.";
      case "resource-exhausted":
        return "Resource exhaustion occurred.";
      case "unauthenticated":
        return "The request does not have valid authentication credentials.";
      case "unavailable":
        return "The service is currently unavailable.";
      case "unimplemented":
        return "Operation is not implemented.";
      case "unknown":
        return "An unknown error occurred.";
      default:
        return "An unknown error occurred. Please try again later.";
    }
  }
}
