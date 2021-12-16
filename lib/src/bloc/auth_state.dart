part of 'auth_bloc.dart';

class AuthInitial extends AuthState {
  const AuthInitial({bool isLoggedIn = false, String? name})
      : super(
          isLoggedIn: isLoggedIn,
          name: name,
        );
}

class AuthLogin extends AuthState {
  const AuthLogin(String name)
      : super(
          isLoggedIn: true,
          name: name,
        );
}

class AuthLogout extends AuthState {
  const AuthLogout() : super(isLoggedIn: false, name: null);
}

abstract class AuthState extends Equatable {
  final bool isLoggedIn;
  final String? name;
  const AuthState({this.isLoggedIn = false, this.name});

  @override
  List<Object> get props => [
        isLoggedIn,
        name ?? "",
      ];
}
