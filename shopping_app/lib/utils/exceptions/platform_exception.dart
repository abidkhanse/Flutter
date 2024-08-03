class TPlatformException implements Exception {
  String code = "error";

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case "not-available":
        return "The requested service is not available on this device.";
      case "network-error":
        return "A network error occurred. Please check your internet connection.";
      case "timeout":
        return "The operation timed out. Please try again.";
      case "invalid-credentials":
        return "The provided credentials are invalid.";
      case "user-cancelled":
        return "The operation was cancelled by the user.";
      case "unregistered-device":
        return "The device is not registered for this service.";
      case "operation-failed":
        return "The operation failed. Please try again.";
      default:
        return "An unknown error occurred. Please try again later.";
    }
  }
}
