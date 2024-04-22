import 'package:example_flutter/abstract_manage/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('product store ...', () async {
    final store = ProductStore();
    final response = await store.fetchAll();
    expect(response.length, 20);
  });
}
