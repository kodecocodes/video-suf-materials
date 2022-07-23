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
        // TODO Save session
        final todayUser = TodayUser(email: email, password: password);
        loginStateNotifier.loggedIn(true);
        // TODO Save User Data
        // TODO Register Auth Listener
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

}
