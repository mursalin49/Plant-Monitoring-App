import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final _db = FirebaseDatabase.instance.ref();

  Stream<int> soilMoistureStream() {
    return _db
        .child('soilMoisture')
        .onValue
        .map((event) => int.tryParse(event.snapshot.value.toString()) ?? 0);
  }

  Stream<bool> motorStatusStream() {
    return _db
        .child('motor')
        .onValue
        .map((event) => event.snapshot.value.toString() == 'on');
  }

  Future<void> toggleMotor(bool turnOn) async {
    await _db.child('motor').set(turnOn ? 'on' : 'off');
  }
}
