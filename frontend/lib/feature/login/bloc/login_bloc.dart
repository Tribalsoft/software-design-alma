import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/auth_service.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc(this.authService) : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      final email = event.email;
      final valid = _validate(email, state.password);
      emit(state.copyWith(email: email, isValid: valid));
    });

    on<PasswordChanged>((event, emit) {
      final password = event.password;
      final valid = _validate(state.email, password);
      emit(state.copyWith(password: password, isValid: valid));
    });

    on<LoginSubmitted>((event, emit) async {
      if (!state.isValid) {
        emit(state.copyWith(
          isFailure: true,
          errorMessage: "Campos inválidos",
        ));
        return;
      }

      emit(state.copyWith(isSubmitting: true, isFailure: false));

      final userData = await authService.login(state.email, state.password);

      if (userData != null) {

        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: true,
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isFailure: true,
          errorMessage: "Credenciales incorrectas",
        ));
      }
    });
  }

  bool _validate(String email, String password) {
    return email.isNotEmpty && password.length >= 6;
  }
}
