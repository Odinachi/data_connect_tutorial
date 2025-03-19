part of 'auth_cubit.dart';

abstract class AuthState {}


class AuthStateInitial extends AuthState {}

class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {}
class AuthUser extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class AuthUnauthenticated extends AuthState {}