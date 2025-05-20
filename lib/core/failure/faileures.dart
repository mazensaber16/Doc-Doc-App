 class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerError extends Failure {
  ServerError({required super.errorMessage});

}

class NetworkError extends Failure {
  NetworkError({required super.errorMessage});

}
