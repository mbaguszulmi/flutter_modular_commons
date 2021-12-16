import 'package:bloc/bloc.dart';
import 'package:commons/src/constants/shared_pref_keys.dart';
import 'package:commons/src/services/local/shared_pref.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is InitialAuthEvent) {
        final user = SharedPref.instance.getString(LoginKey.loginData);
        final isLoggedIn = user != null;
        return emit(AuthInitial(isLoggedIn: isLoggedIn, name: user));
      }

      if (event is LoginAuthEvent) {
        await SharedPref.instance.setString(LoginKey.loginData, event.name);
        debugPrint("Login success!");
        return emit(AuthLogin(event.name));
      }

      if (event is LogoutAuthEvent) {
        await SharedPref.instance.remove(LoginKey.loginData);
        return emit(const AuthLogout());
      }
    });
  }
}
