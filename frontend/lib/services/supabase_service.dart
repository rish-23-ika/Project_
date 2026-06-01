import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://klbzfchnalupotxvhurw.supabase.co',
      anonKey: 'sb_publishable_Z9ShVmkX3hped3qyvO4q1g_2fV3LloC',
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}