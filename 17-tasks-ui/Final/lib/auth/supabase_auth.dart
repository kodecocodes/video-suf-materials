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

        loginStateNotifier.update(true, todayUser);
        saveUserSession(response.data!);
        saveUserData(todayUser, true);
        registerAuthListener();
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
        _logoutState();
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

  void _logoutState() {
    prefs.setBool(loggedInKey, false);
    prefs.remove(sessionKey);
    loginStateNotifier.update(false, null);
  }

  void logout() async {
    _logoutState();
    try {
      await client.auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }

  TodayUser? _getUser() {
    final userString = prefs.getString(userKey);
    if (userString != null) {
      return TodayUser.fromJson(jsonDecode(userString));
    }
    return null;
  }

  Future<bool> recoverSession() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(sessionKey)) {
      log('Found persisted session string, attempting to recover session');
      final jsonStr = prefs.getString(sessionKey)!;
      final response = await client.auth.recoverSession(jsonStr);
      if (response.error != null) {
        log('Problems recovering session: ${response.error}');
      }
      if (response.error == null && response.data != null) {
        final session = response.data!;
        log('Session successfully recovered for user ID: ${session.user!.id}');
        saveUserSession(response.data!);
        loginStateNotifier.loggedIn(true);
        // saveUserData(todoUser, true);
        return true;
      }
    }
    return false;
  }

  void loadUser() async {
    final loggedIn = prefs.getBool(loggedInKey) ?? false;
    if (!loggedIn) {
      return;
    }
    final recovered = await recoverSession();
    if (!recovered) {
      final user = _getUser();
      if (user != null &&
          true == user.email.isNotEmpty &&
          true == user.password?.isNotEmpty) {
        await login(user.email, user.password!);
      }
    }
  }
}
