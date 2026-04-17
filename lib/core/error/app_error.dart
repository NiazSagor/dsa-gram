class AppError {
  final String message;
  final String? code;

  AppError({required this.message, this.code});

  @override
  String toString() => 'AppError(message: $message, code: $code)';
}
