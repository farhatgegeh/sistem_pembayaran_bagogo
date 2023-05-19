import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../domain/models/location_model.dart';
import '../../domain/respositories/repository.dart';
import '../../utils/execptions.dart';
import '../data_sources/remote/get_location_on_firebase.dart';

class RepositoryIMPL implements Repository {
  final LocationDataSource locationDataSource;

  RepositoryIMPL({required this.locationDataSource});

  @override
  Future<Either<Failure, LocationModel>> getLocation() async {
    try {
      final result = await locationDataSource.getLocation();
      return Right(result);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure('$e'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
