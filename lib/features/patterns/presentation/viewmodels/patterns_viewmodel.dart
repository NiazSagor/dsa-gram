import 'package:flutter/material.dart';
import '../../data/models/pattern_model.dart';
import '../../data/repository/pattern_repository.dart';
import '../../../../core/error/app_error.dart';

class PatternsViewModel extends ChangeNotifier {
  final PatternRepository _repository;

  PatternsViewModel({required PatternRepository repository}) : _repository = repository;

  List<PatternModel> _patterns = [];
  List<PatternModel> get patterns => _patterns;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AppError? _error;
  AppError? get error => _error;

  Future<void> fetchPatterns() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _patterns = await _repository.getPatterns();
    } on AppError catch (e) {
      _error = e;
    } catch (e) {
      _error = AppError(message: 'An unexpected error occurred');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPatternById(String id) async {
    // This could be used if we need to refresh a single pattern or if we navigate directly to it
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final pattern = await _repository.getPatternById(id);
      final index = _patterns.indexWhere((p) => p.id == id);
      if (index != -1) {
        _patterns[index] = pattern;
      } else {
        _patterns.add(pattern);
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
