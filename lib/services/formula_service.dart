import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/formula_model.dart';

class FormulaService {
  static const String storageKey = "feed_formulas";

  Future<void> saveFormulas(
      Map<String, List<FormulaModel>> formulas) async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> jsonMap = {};

    formulas.forEach((feedType, list) {
      jsonMap[feedType] =
          list.map((formula) => formula.toJson()).toList();
    });

    await prefs.setString(
      storageKey,
      jsonEncode(jsonMap),
    );
  }

  Future<Map<String, List<FormulaModel>>> loadFormulas() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(storageKey);

    if (data == null) {
      return {};
    }

    final decoded = jsonDecode(data);

    Map<String, List<FormulaModel>> result = {};

    decoded.forEach((feedType, value) {
      result[feedType] =
          (value as List)
              .map((e) => FormulaModel.fromJson(e))
              .toList();
    });

    return result;
  }
}