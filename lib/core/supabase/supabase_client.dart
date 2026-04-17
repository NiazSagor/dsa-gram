import 'package:supabase_flutter/supabase_flutter.dart';
import '../constants/constants.dart';

class SupabaseClientManager {
  static final SupabaseClientManager _instance = SupabaseClientManager._internal();
  
  factory SupabaseClientManager() => _instance;
  
  SupabaseClientManager._internal();

  SupabaseClient get client => Supabase.instance.client;

  static Future<void> init() async {
    await Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseAnonKey,
    );
  }
}
