import 'dart:async';

import 'package:http/http.dart' as http;

import '../config/build_server.dart';

class IngredientRepository {
  static final client = http.Client();

  static Future<String> getAllIngredient() async {
    try {
      var response = await client.get(
        BuildServer.buildUrl('ingredient'),
      );
      return response.body;
    } on TimeoutException catch (e) {
      return e.toString();
    }
  }
}
