class LoginState {
  final String email;
  final String password;
  final bool isValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String? errorMessage;
  final Map<String, dynamic>? userData;

  LoginState({
    required this.email,
    required this.password,
    required this.isValid,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
    this.errorMessage,
    this.userData,
  });

  factory LoginState.initial() => LoginState(
        email: '',
        password: '',
        isValid: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        userData: null,
      );

  LoginState copyWith({
    String? email,
    String? password,
    bool? isValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    Map<String, dynamic>? userData,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage,
      userData: userData ?? this.userData,
    );
  }
}
