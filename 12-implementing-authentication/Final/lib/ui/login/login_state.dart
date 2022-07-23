import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/user.dart';

late SharedPreferences globalSharedPreferences;

final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  return globalSharedPreferences;
});

final logInStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState(loggedIn: false));

  void loggedIn(bool value) {
    state = LoginState(loggedIn: value, user: state.user);
  }

  void user(TodayUser? newUser) {
    state = LoginState(loggedIn: state.loggedIn, user: newUser);
  }

  void update(bool loggedIn, TodayUser? user) {
    state = LoginState(loggedIn: loggedIn, user: user);
  }
}

class LoginState extends ChangeNotifier {
  final bool loggedIn;
  final TodayUser? user;

  LoginState({required this.loggedIn, this.user});
}
