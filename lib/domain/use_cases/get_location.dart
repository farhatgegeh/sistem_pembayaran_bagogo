import 'package:dartz/dartz.dart';

import '../../utils/execptions.dart';
import '../models/location_model.dart';
import '../respositories/repository.dart';

class GetLocationData {
  final Repository repository;

  GetLocationData(this.repository);

  Future<Either<Failure, LocationModel>> execute() async {
    return repository.getLocation();
  }
}
