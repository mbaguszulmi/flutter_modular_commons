part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class InitialAuthEvent extends AuthEvent {}

class LoginAuthEvent extends AuthEvent {
  final String name;
  const LoginAuthEvent(this.name);
}

class LogoutAuthEvent extends AuthEvent {}
