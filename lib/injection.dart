import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/remote/get_location_on_firebase.dart';
import 'data/respositories_impl/repositories_impl.dart';
import 'domain/respositories/repository.dart';
import 'domain/use_cases/get_location.dart';
import 'presentation/providers/get_distance_location_bloc.dart';
import 'presentation/providers/get_location_bloc.dart';
import 'presentation/providers/qr_code_scanner_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerFactory(
    () => GetLocationBloc(locator()),
  );

  locator.registerFactory(
    () => QrCodeScannerBloc(),
  );

  locator.registerFactory(
    () => GetDistanceBloc(),
  );

  locator.registerLazySingleton(
    () => GetLocationData(locator()),
  );

  locator.registerLazySingleton<Repository>(
    () => RepositoryIMPL(locationDataSource: locator()),
  );

  locator.registerLazySingleton<LocationDataSource>(
    () => LocationDataSourceIMPL(database: locator()),
  );

  locator.registerLazySingleton(
    () => FirebaseDatabase.instance,
  );
}
