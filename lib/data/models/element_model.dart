ElementModel elementModelFromJson(dynamic json) => ElementModel.fromJson(json);

class ElementModel {
  final String name;
  final String symbol;
  final num value;
  final int atomicNumber;

  ElementModel({
    required this.name,
    required this.symbol,
    required this.value,
    required this.atomicNumber,
  });

  factory ElementModel.fromJson(json) {
    return ElementModel(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      value: json['value'] as num,
      atomicNumber: json['atomic_no'] as int,
    );
  }
}
