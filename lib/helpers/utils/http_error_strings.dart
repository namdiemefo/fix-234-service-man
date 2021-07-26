class HttpErrorStrings {
  static const String CONNECTION_TIMEOUT_ACTIVE =
      'Unable to make connection at the moment \nthis may be caused by an unstable network \nor connection to the server, please try again later.';

  static const String CONNECTION_TIMEOUT_NOT_ACTIVE =
      'Looks like you have no active connection at the moment,\n please try again when you have an active connection.';

  static const String SEND_TIMEOUT =
      'Looks like you have an unstable network at the moment,\n please try again when network stabilizes.';

  static const String RECEIVE_TIMEOUT =
      'Unable to connect to server at the moment';

  static const String BAD_RESPONSE =
      'Unable to complete request at the moment';

  static const String OPERATION_CANCELLED = 'Operation was cancelled';

  static const String DEFAULT =
      'Looks like you are not connected to any active network.\n Please connect and try again';

  static const String UNKNOWN = 'Unknown error occurred';
  static const String API_GATEWAY_TIMEOUT = 'Endpoint request timed out';
  static const String UNAUTHORIZED = '401 Unauthorized';
}