import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/supabase/supabase_client.dart';
import '../models/pattern_model.dart';

class PatternRepository {
  final SupabaseClient _client = SupabaseClientManager().client;

  Future<List<PatternModel>> getPatterns() async {
    try {
      final response = await _client
          .from('patterns')
          .select()
          .order('order_index', ascending: true);
      
      return (response as List)
          .map((json) => PatternModel.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw AppError(message: e.message, code: e.code);
    } catch (e) {
      throw AppError(message: 'An unexpected error occurred while fetching patterns');
    }
  }

  Future<PatternModel> getPatternById(String id) async {
    try {
      final response = await _client
          .from('patterns')
          .select()
          .eq('id', id)
          .single();
      
      return PatternModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw AppError(message: e.message, code: e.code);
    } catch (e) {
      throw AppError(message: 'An unexpected error occurred while fetching pattern');
    }
  }
}
