import 'dart:convert';

import 'package:flutter/services.dart';

// import './core/store/store_notifier.dart';
import './core/store/store_stream.dart';
import './models/product.dart';

// class ProductStore extends StoreNotifier<List<Product>> {
class ProductStore extends StoreStream<List<Product>> {
  ProductStore() : super([]);

  Future<List<Product>> fetchAll() async {
    final response = await rootBundle.loadString('assets/mock/mock_data.json');
    await Future.delayed(const Duration(milliseconds: 20000));
    final List<dynamic> decoded = jsonDecode(response);
    final state = <Product>[];
    for (final item in decoded) {
      final product = Product.fromMap(item);
      state.add(product);
    }
    dispatch(state);
    return state;
  }
}
