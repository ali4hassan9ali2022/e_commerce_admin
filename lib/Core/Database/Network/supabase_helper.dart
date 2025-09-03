import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseHelper {
  static const _url = "https://pjjmoxcbzwigcrmiengg.supabase.co";
  static const _anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqam1veGNiendpZ2NybWllbmdnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTUxOTcwMDEsImV4cCI6MjA3MDc3MzAwMX0.omVANrKNN55NbT7u2vLbRwQj03qpumweBy8mFr3rvVI";
  static Future<void> initSupabase() async {
    await Supabase.initialize(url: _url, anonKey: _anonKey);
  }

  static SupabaseClient supabase = Supabase.instance.client;
  static Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    return response;
  }

  static Future<AuthResponse> logIn({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response;
  }

  /// Add or Create Data
  static Future<bool> addData({
    required String tableName,
    required Map<String, dynamic> values,
  }) async {
    try {
      final response = await supabase.from(tableName).insert(values).select();
      return response.isNotEmpty;
    } catch (e) {
      log("Add Error: ${e.toString()}");
      return false;
    }
  }

  /// Get or Fetch Data
  static Future<Map<String, dynamic>?> getData({
    required String tableName,
    required String filterColumn,
    required dynamic filterValue,
    String orderBy = "created_at",
    bool ascending = false,
  }) async {
    try {
      final response = await supabase
          .from(tableName)
          .select()
          .eq(filterColumn, filterValue)
          .order(orderBy, ascending: ascending)
          .maybeSingle();
      return response;
    } catch (e) {
      print("Get Error: $e");
      return {};
    }
  }

  /// Update Data
  static Future<bool> updateData({
    required String tableName,
    required Map<String, dynamic> values,
    required String filterColumn,
    required dynamic filterValue,
  }) async {
    try {
      final response = await supabase
          .from(tableName)
          .update(values)
          .eq(filterColumn, filterValue)
          .select();
      return response.isNotEmpty;
    } catch (e) {
      print("Update Error: $e");
      return false;
    }
  }

  /// Delete Data
  static Future<bool> deleteData({
    required String tableName,
    required String filterColumn,
    required dynamic filterValue,
  }) async {
    try {
      final response = await supabase
          .from(tableName)
          .delete()
          .eq(filterColumn, filterValue)
          .select();
      return response.isNotEmpty;
    } catch (e) {
      print("Delete Error: $e");
      return false;
    }
  }
}
