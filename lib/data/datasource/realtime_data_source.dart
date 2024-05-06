import 'package:crops_prediction/data/models/prediction_model.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDataBase {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Stream<PredictionModel> read(String path) {
    final data = _database.ref(path).onValue;
    final Stream<PredictionModel> predictionStream = data.map((event) {
      final Map<dynamic, dynamic> snapshot = event.snapshot.value as Map<dynamic, dynamic>;
      return predictionModelFromJson(snapshot);
    });
    return predictionStream;
  }
}
