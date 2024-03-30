import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:cash_swift/shared/models/upi_model.dart';

class UpiListController {
  UpiListController() {
    getUpis();
  }

  final upisNotifier = ValueNotifier<List<UpiModel>>(<UpiModel>[]);
  List<UpiModel> get upis => upisNotifier.value;
  set upis(List<UpiModel> value) => upisNotifier.value = value;

  void getUpis() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('upis');
      upis = response?.map((upi) => UpiModel.fromJson(upi)).toList() ?? [];
    } catch (e, s) {
      debugPrint('Error when getting upis ${e.toString()}');
      debugPrint('Stack when getting upis ${s.toString()}');
    }
  }

  void dispose() {
    upisNotifier.dispose();
  }
}
