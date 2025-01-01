part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  // create sealed class with empty constructor
  const AuthState();
} //  then four states classes initial ,loading ,loaded/success,failure

final class AuthInitial extends AuthState {}

final class AuthLoading
    extends AuthState {} //show common widget loader (progress indicator)

final class AuthSuccess extends AuthState {
  // show user
  final User user;
  const AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
} //show message through string variable
