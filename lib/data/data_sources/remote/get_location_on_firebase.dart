import 'package:firebase_database/firebase_database.dart';

import '../../../domain/models/location_model.dart';

abstract class LocationDataSource {
  Future<LocationModel> getLocation();
}

class LocationDataSourceIMPL extends LocationDataSource {
  FirebaseDatabase database = FirebaseDatabase.instance;

  LocationDataSourceIMPL({required this.database});

  @override
  Future<LocationModel> getLocation() async {
    DatabaseReference databaseRef = database.ref('Data/Lokasi');

    final event = await databaseRef.once();
    var data = event.snapshot.value as Map<dynamic, dynamic>?;

    if (data != null) {
      double latitude = data['Latitude'] as double? ?? 0.0;
      double longitude = data['Longitude'] as double? ?? 0.0;

      return LocationModel(
        lat: latitude,
        long: longitude,
      );
    } else {
      throw Exception('Data not found in Firebase.');
    }
  }
}
