import 'package:flutter/material.dart';
import 'package:melhores_praticas/features/category/model/category.dart';
import 'package:melhores_praticas/features/category/repository/category_repository.dart';

abstract class ICategoryController extends ChangeNotifier {
  bool get isLoading;
  bool get hasError;
  String get error;
  Future<void> fetchList({bool isError = false});
  List<Category> get list;
}

class CategoryController extends ChangeNotifier implements ICategoryController {
  final ICategoryRepository repository;

  final Future<void> Function(String) onError;


  CategoryController({
    required this.repository,
    required this.onError,
  });

  bool _isLoading = false;

  List<Category> _list = [];

  String _error = '';

  void _setIsLoading({bool value = false}) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError({String value = ''}) {
    _error = value;
    notifyListeners();
  }

  @override
  String get error => _error;

  @override
  Future<void> fetchList({bool isError = false}) async {
    try {
      _setError(value: '');
      _setIsLoading(value: true);
      if (isError) {
        _list = await repository.fetchListWithError();
      } else {
        _list = await repository.fetchList();
      }
    } on Exception catch (e) {
      _setError(value: e.toString());
      onError(e.toString());
    } finally {
      _setIsLoading();
    }
  }

  @override
  bool get hasError => _error.isNotEmpty;

  @override
  bool get isLoading => _isLoading;

  @override
  List<Category> get list => _list;
}
