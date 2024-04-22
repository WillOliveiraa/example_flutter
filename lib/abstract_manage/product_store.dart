import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/product.dart';

class ProductStore extends ChangeNotifier {
  final state = <Product>[];

  Future<List<Product>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 20000));
    final response = await rootBundle.loadString('assets/mock/mock_data.json');
    final List<dynamic> decoded = jsonDecode(response);
    for (final item in decoded) {
      final product = Product.fromMap(item);
      state.add(product);
    }
    notifyListeners();
    return state;
  }
}
