import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

// BLOC EVENT
abstract class GetDistanceEvent extends Equatable {
  const GetDistanceEvent();

  @override
  List<Object> get props => [];
}

class GetDistanceLocationEvent extends GetDistanceEvent {
  final double startedLat;
  final double startedLong;
  final double endLat;
  final double endLong;

  const GetDistanceLocationEvent({
    required this.startedLat,
    required this.startedLong,
    required this.endLat,
    required this.endLong,
  });

  @override
  List<Object> get props => [
        startedLat,
        startedLong,
        endLat,
        endLong,
      ];
}

// BLOC STATE
abstract class GetDistanceState extends Equatable {
  const GetDistanceState();

  @override
  List<Object> get props => [];
}

class GetDistanceLocationInitial extends GetDistanceState {}

class DistanceLoadedState extends GetDistanceState {
  final double total;

  const DistanceLoadedState(this.total);

  @override
  List<Object> get props => [total];
}

// BLOC CLASS
class GetDistanceBloc extends Bloc<GetDistanceEvent, GetDistanceState> {
  GetDistanceBloc() : super(GetDistanceLocationInitial()) {
    on<GetDistanceLocationEvent>((event, emit) async {
      final totalCost = await getDistanceBetween(
        startedLat: event.startedLat,
        startedLong: event.startedLong,
        endLat: event.endLat,
        endLong: event.endLong,
      );

      emit(DistanceLoadedState(totalCost));
    });
  }

  getDistanceBetween({
    required double startedLat,
    required double startedLong,
    required double endLat,
    required double endLong,
  }) async {
    double startLatitude = startedLat;
    double startLongitude = startedLong;

    double endLatitude = endLat;
    double endLongitude = endLong;

    double distanceInMeters = Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );

    double totalCost = calculateTotalCost(distanceInMeters);

    return totalCost;
  }

  double calculateTotalCost(double distanceInMeters) {
    const double initialCost = 0;
    const double costPer50Meters = 500;
    int additionalCosts = (distanceInMeters / 50).ceil() - 1;
    double totalCost = initialCost + (additionalCosts * costPer50Meters);

    if (totalCost < 0) {
      return 0.0;
    }

    return totalCost;
  }
}
