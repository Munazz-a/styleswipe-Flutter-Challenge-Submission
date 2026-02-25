import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final Box box = Hive.box('appBox');

  List<Product> products = [];
  Map<int, String> preferences = {};
  List<String> history = [];

  bool isLoading = true;
  String? error;

  ProductProvider() {
    loadPreferences();
    loadHistory();
    loadProducts();
  }
  

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      notifyListeners();

      products = await _apiService.fetchProducts();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  void setPreference(int productId, String value) {
  preferences[productId] = value;

  final stringKeyMap = preferences.map(
    (key, value) => MapEntry(key.toString(), value),
  );

  box.put('preferences', stringKeyMap);

  notifyListeners();
}


  void loadPreferences() {
  final stored = box.get('preferences');

  if (stored != null && stored is Map) {
    preferences = {};

    stored.forEach((key, value) {
      preferences[int.parse(key.toString())] = value.toString();
    });
  }
}

  void addToHistory(String url) {
    if (!history.contains(url)) {
      history.add(url);
    }
    box.put('history', history);
    notifyListeners();
  }

  void loadHistory() {
    history = List<String>.from(box.get('history', defaultValue: []));
  }
}