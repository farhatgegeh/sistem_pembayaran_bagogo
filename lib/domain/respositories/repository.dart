import 'package:dartz/dartz.dart';

import '../../utils/execptions.dart';
import '../models/location_model.dart';

abstract class Repository {
  Future<Either<Failure, LocationModel>> getLocation();
}
