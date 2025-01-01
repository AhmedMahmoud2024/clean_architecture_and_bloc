part of 'auth_bloc.dart';

@immutable // events we have sealed base class //AuthEvent
sealed class AuthEvent {} //we have 3 events :signup ,signin/login,isUserloggedin

class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;
  AuthSignUp({required this.email, required this.password, required this.name});
}

class AuthLogin extends AuthEvent {
  final String email;
  final String password;
  AuthLogin({required this.email, required this.password});
}

class AuthIsUserLoggedIn extends AuthEvent {}
