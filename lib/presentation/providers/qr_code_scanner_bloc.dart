import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// BLOC EVENT
abstract class QrCodeScannerEvent extends Equatable {
  const QrCodeScannerEvent();

  @override
  List<Object> get props => [];
}

class OnScannerEvent extends QrCodeScannerEvent {
  final String data;

  const OnScannerEvent(this.data);

  @override
  List<Object> get props => [data];
}

class DeleteScannerDataEvent extends QrCodeScannerEvent {
  final String data;

  const DeleteScannerDataEvent(this.data);

  @override
  List<Object> get props => [data];
}

// BLOC STATE
abstract class QrCodeScannerState extends Equatable {
  const QrCodeScannerState();

  @override
  List<Object> get props => [];
}

class QrCodeScannerInitial extends QrCodeScannerState {}

class ScannerState extends QrCodeScannerState {
  final List<String> capturedDataList;

  const ScannerState(this.capturedDataList);

  @override
  List<Object> get props => [capturedDataList];
}

// BLOC CLASS
class QrCodeScannerBloc extends Bloc<QrCodeScannerEvent, QrCodeScannerState> {
  QrCodeScannerBloc() : super(QrCodeScannerInitial()) {
    on<OnScannerEvent>((event, emit) {
      if (state is ScannerState) {
        final List<String> newDataList = List.from(
          (state as ScannerState).capturedDataList,
        );
        newDataList.add(event.data);
        emit(ScannerState(newDataList));
      } else {
        emit(ScannerState([event.data]));
      }
    });

    on<DeleteScannerDataEvent>((event, emit) {
      if (state is ScannerState) {
        final List<String> newDataList = List.from(
          (state as ScannerState).capturedDataList,
        );
        newDataList.remove(event.data);
        emit(ScannerState(newDataList));
      }
    });
  }
}
