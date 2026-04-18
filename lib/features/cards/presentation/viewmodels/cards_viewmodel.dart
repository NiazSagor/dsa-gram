import 'package:flutter/material.dart';
import '../../data/models/card_model.dart';
import '../../data/repository/card_repository.dart';
import '../../../../core/error/app_error.dart';

class CardsViewModel extends ChangeNotifier {
  final CardRepository _repository;

  CardsViewModel({required CardRepository repository}) : _repository = repository;

  final Map<String, List<CardModel>> _patternCards = {};
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AppError? _error;
  AppError? get error => _error;

  List<CardModel> getCardsForPattern(String patternId) {
    return _patternCards[patternId] ?? [];
  }

  Future<void> fetchCardsByPatternId(String patternId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final cards = await _repository.getCardsByPatternId(patternId);
      _patternCards[patternId] = cards;
    } on AppError catch (e) {
      _error = e;
    } catch (e) {
      _error = AppError(message: 'An unexpected error occurred');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCardById(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final card = await _repository.getCardById(id);
      
      // Update the card in our cache if it exists
      if (_patternCards.containsKey(card.patternId)) {
        final index = _patternCards[card.patternId]!.indexWhere((c) => c.id == id);
        if (index != -1) {
          _patternCards[card.patternId]![index] = card;
        } else {
          _patternCards[card.patternId]!.add(card);
        }
      } else {
        _patternCards[card.patternId] = [card];
      }
    } on AppError catch (e) {
      _error = e;
    } catch (e) {
      _error = AppError(message: 'An unexpected error occurred');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
