import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/supabase/supabase_client.dart';
import '../models/card_model.dart';

class CardRepository {
  final SupabaseClient _client = SupabaseClientManager().client;

  Future<List<CardModel>> getCardsByPatternId(String patternId) async {
    try {
      final response = await _client
          .from('cards')
          .select()
          .eq('pattern_id', patternId)
          .order('order_index', ascending: true);
      
      return (response as List)
          .map((json) => CardModel.fromJson(json))
          .toList();
    } on PostgrestException catch (e) {
      throw AppError(message: e.message, code: e.code);
    } catch (e) {
      throw AppError(message: 'An unexpected error occurred while fetching cards');
    }
  }

  Future<CardModel> getCardById(String id) async {
    try {
      final response = await _client
          .from('cards')
          .select()
          .eq('id', id)
          .single();
      
      return CardModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw AppError(message: e.message, code: e.code);
    } catch (e) {
      throw AppError(message: 'An unexpected error occurred while fetching card');
    }
  }
}
