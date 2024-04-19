import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/worker.dart';

class WorkerService {
  Future<List<Worker>> fetchAll() async {
    try {
      final response =
          await http.get(Uri.parse('https://retoolapi.dev/p2HBvH/data'));
      if (response.statusCode != 200) {
        throw Exception('Failed to load worker');
      }
      final result = jsonDecode(response.body) as List<dynamic>;
      return result.map((e) => Worker.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Failed to load worker catch: $e');
    }
  }
}
