import 'dart:convert';

class UpiModel {
  factory UpiModel.fromJson(String source) =>
      UpiModel.fromMap(json.decode(source));

  factory UpiModel.fromMap(Map<String, dynamic> map) {
    return UpiModel(
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  factory UpiModel.empty() {
    return UpiModel(
      name: '',
      dueDate: '',
      value: 0,
      barcode: '',
    );
  }

  UpiModel({
    required this.name,
    required this.dueDate,
    required this.value,
    required this.barcode,
  });

  final String name;
  final String dueDate;
  final double value;
  final String barcode;

  UpiModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return UpiModel(
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpiModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return name.hashCode ^ dueDate.hashCode ^ value.hashCode ^ barcode.hashCode;
  }

  @override
  String toString() {
    return 'UpiModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }
}
