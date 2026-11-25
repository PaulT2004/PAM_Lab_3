import 'dart:convert';
import 'package:flutter/services.dart';

class AppDataRepository {
  Future<Map<String, dynamic>> loadData() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/app_data.json',
    );

    final decodedData = jsonDecode(jsonString);

    return Map<String, dynamic>.from(decodedData);
  }
}