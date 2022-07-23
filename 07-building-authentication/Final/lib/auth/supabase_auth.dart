import 'dart:convert';
import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import '../router/route_names.dart';
import '../ui/login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user.dart';

const String url = 'https://ycwiaycjipfkwxnnrujt.supabase.co';

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
}
