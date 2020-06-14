class SchemeConsistencyException implements Exception {
  final String message;

  SchemeConsistencyException([this.message = 'Schemes consistency error']);

  String toString() {
    if (message == null) return '$SchemeConsistencyException';
    return '$SchemeConsistencyException: $message';
  }
}

abstract class DiagnosticMessageException implements Exception {
  String get diagnosticMessage;
}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);
}

class ApiInternalServerException extends ApiException {
  ApiInternalServerException()
      : super(
          'Internal Server Error');
}

class ApiDataNotFoundException extends ApiException {
  ApiDataNotFoundException()
      : super('Data Not Found Error');
}
