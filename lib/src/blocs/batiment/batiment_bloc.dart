import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'batiment_event.dart';
part 'batiment_state.dart';

class BatimentBloc extends Bloc<BatimentEvent, BatimentState> {
  BatimentBloc() : super(BatimentInitial()) {
    on<BatimentEvent>((event, emit) {});
  }
}
