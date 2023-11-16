import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

CollectionReference strategyCollection =
    FirebaseFirestore.instance.collection('strategy');

Future<void> saveStrategyData(Map<String, dynamic> strategyData) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String strategyDataJson = jsonEncode(strategyData);
  await prefs.setString('strategyData', strategyDataJson);
}

Future<void> getStrategyData() async {
  try {
    DocumentSnapshot snapshot = await strategyCollection.doc('puriya').get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      await saveStrategyData(data);
    } else {
      log('Документ не найден!');
    }
  } catch (e) {
    log('Ошибка при получении данных: $e');
  }
}

Future<Map<String, dynamic>?> getSavedStrategyData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? strategyDataJson = prefs.getString('strategyData');
  if (strategyDataJson != null) {
    Map<String, dynamic> strategyData = jsonDecode(strategyDataJson);
    return strategyData;
  }
  return null;
}
