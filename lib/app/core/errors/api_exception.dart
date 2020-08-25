class ApiException implements Exception {
  final message;
  ApiException({this.message});
}

class NotFoundException extends ApiException {
  final message;
  NotFoundException({this.message});
}

class InternalServerErrorException extends ApiException {
  final message;
  InternalServerErrorException({this.message});
}

class ErrorsException extends ApiException {
  final message;
  ErrorsException({this.message});
}