import 'element_model.dart';

PredictionModel predictionModelFromJson(dynamic json) => PredictionModel.fromJson(json['data']);

class PredictionModel {
  final String prediction;
  final num moisture;
  final num rainfall;
  final ElementModel nitrogen;
  final ElementModel phosphorus;
  final ElementModel potassium;

  PredictionModel({
    required this.prediction,
    required this.moisture,
    required this.rainfall,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });

  factory PredictionModel.fromJson(json) {
    return PredictionModel(
      moisture: json['moisture'],
      rainfall: json['rainfall'],
      nitrogen: elementModelFromJson(json['N']),
      phosphorus: elementModelFromJson(json['P']),
      potassium: elementModelFromJson(json['K']),
      prediction: json['prediction'] as String,
    );
  }
}
