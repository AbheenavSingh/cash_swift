import 'package:shared_preferences/shared_preferences.dart';

import 'package:cash_swift/shared/models/upi_model.dart';

class InsertUpiController {
  UpiModel model = UpiModel.empty();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'The name cannot be empty' : null;

  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? 'The due date cannot be empty' : null;

  String? validateValue(double value) =>
      value == 0 ? 'Enter an amount greater than \$0.00' : null;

  String? validateCode(String? value) =>
      value?.isEmpty ?? true ? 'Upi code cannot be empty' : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) =>
      model = model.copyWith(
        name: name,
        dueDate: dueDate,
        value: value,
        barcode: barcode,
      );

  Future<void> saveUpi() async {
    final instance = await SharedPreferences.getInstance();
    final upis = instance.getStringList('upis') ?? <String>[];
    upis.add(model.toJson());
    await instance.setStringList('upis', upis);
    return;
  }
}
