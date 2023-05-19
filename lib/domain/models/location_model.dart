import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final double? lat;
  final double? long;

  const LocationModel({this.lat, this.long});

  @override
  List<Object?> get props => [lat, long];
}
