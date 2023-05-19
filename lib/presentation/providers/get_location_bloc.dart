import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/location_model.dart';
import '../../domain/use_cases/get_location.dart';

// LOCATION EVENT
abstract class GetLocationEvent extends Equatable {
  const GetLocationEvent();

  @override
  List<Object> get props => [];
}

class OnGetStartedLocationEvent extends GetLocationEvent {}

class OnGetFinalLocationEvent extends GetLocationEvent {}

// LOCATION STATE
abstract class GetLocationState extends Equatable {
  const GetLocationState();

  @override
  List<Object> get props => [];
}

class GetLocationInitial extends GetLocationState {}

class GetLocationLoading extends GetLocationState {}

class GetLocationError extends GetLocationState {
  final String message;

  const GetLocationError(this.message);

  @override
  List<Object> get props => [message];
}

class GetStartLocationLoaded extends GetLocationState {
  final LocationModel data;

  const GetStartLocationLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class GetFinalLocationLoaded extends GetLocationState {
  final LocationModel data;

  const GetFinalLocationLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class CombinedLocationLoaded extends GetLocationState {
  final LocationModel startLocation;
  final LocationModel finalLocation;

  const CombinedLocationLoaded(this.startLocation, this.finalLocation);

  @override
  List<Object> get props => [startLocation, finalLocation];
}

// LOCATION BLOC
class GetLocationBloc extends Bloc<GetLocationEvent, GetLocationState> {
  final GetLocationData _locationData;

  GetLocationBloc(this._locationData) : super(GetLocationInitial()) {
    on<OnGetStartedLocationEvent>((event, emit) async {
      final result = await _locationData.execute();

      result.fold(
        (failure) => emit(GetLocationError(failure.message)),
        (startLocation) => emit(GetStartLocationLoaded(startLocation)),
      );
    });

    on<OnGetFinalLocationEvent>((event, emit) async {
      final result = await _locationData.execute();

      result.fold(
        (failure) => emit(GetLocationError(failure.message)),
        (finalLocation) {
          final currentState = state;
          if (currentState is GetStartLocationLoaded) {
            emit(CombinedLocationLoaded(currentState.data, finalLocation));
          } else {
            emit(GetFinalLocationLoaded(finalLocation));
          }
        },
      );
    });
  }
}
