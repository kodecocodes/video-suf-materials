import 'dart:convert';
import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import '../router/route_names.dart';
import '../ui/login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';

const String url = '<replace>';

Supabase? _supabaseInstance;
SupaAuthManager? _supaAuthManager;

final supaBaseAuthProvider =
    riverpod.FutureProvider<SupaAuthManager>((ref) async {
  if (_supabaseInstance == null) {
    final sharedPreferences = ref.read(sharedPrefProvider);
    _supabaseInstance = await Supabase.initialize(
      url: url,
      anonKey: SupaAuthManager.apikey,
      debug: true,
    );
    final client = _supabaseInstance!.client;
    _supaAuthManager = SupaAuthManager(client, sharedPreferences, ref);
  }
  return _supaAuthManager!;
});

class SupaAuthManager {
  static const apikey = String.fromEnvironment('API_KEY');

  final riverpod.FutureProviderRef ref;
  SupabaseClient client;
  late LoginStateNotifier loginStateNotifier;
  late LoginState loginState;
  final SharedPreferences prefs;

  SupaAuthManager(this.client, this.prefs, this.ref) {
    loginStateNotifier = ref.read(logInStateProvider.notifier);
    loginState = ref.watch(logInStateProvider);
  }

  Future createUser(String email, String password) async {
    try {
      final response = await client.auth.signUp(email, password);
      if (response.data != null) {
        saveUserSession(response.data!);
        final todoUser = TodayUser(email: email, password: password);
        loginStateNotifier.loggedIn(true);
        saveUserData(todoUser, true);
        registerAuthListener();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future login(String email, String password) async {
    try {
      final response =
          await client.auth.signIn(email: email, password: password);
      if (response.data != null) {
        final todayUser = TodayUser(
            email: email, password: password, userId: response.data?.user?.id);

        // TODO Update login state
        // TODO Save session
        // TODO Save User Data
        // TODO Register Auth Listener
        return todayUser;
      } else if (response.error != null) {
        return response.error?.message;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void saveUserSession(Session session) async {
    await prefs.setString(sessionKey, session.persistSessionString);
  }

  void saveUserData(TodayUser? todoUser, bool loggedIn) {
    if (todoUser != null) {
      prefs.setString(userKey, jsonEncode(todoUser));
    } else {
      prefs.remove(userKey);
    }
    log('saveUserData: Logged In: $loggedIn todoUser: $todoUser');
    prefs.setBool(loggedInKey, loggedIn);
  }

  void authChanged(AuthChangeEvent event, Session? session) {
    log('authChanged: event: $event session: $session');
    switch (event) {
      case AuthChangeEvent.passwordRecovery:
        // TODO: Handle this case.
        break;
      case AuthChangeEvent.signedIn:
        loginStateNotifier.loggedIn(true);
        if (session != null) {
          saveUserSession(session);
        }
        break;
      case AuthChangeEvent.signedOut:
        // TODO: Add Logout
        break;
      case AuthChangeEvent.tokenRefreshed:
        if (session != null) {
          saveUserSession(session);
        }
        break;
      case AuthChangeEvent.userUpdated:
        if (session != null) {
          saveUserSession(session);
        }
        break;
    }
  }

  void registerAuthListener() {
    client.auth.onAuthStateChange((event, session) {
      authChanged(event, session);
    });
  }
}
