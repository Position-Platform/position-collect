import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeGetLocation>(_homeGetLocation);
  }

  void _homeGetLocation(
    HomeGetLocation event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      Position position = await Geolocator.getCurrentPosition();
      return emit(HomeLocation(position));
    } catch (_) {
      return emit(HomeError());
    }
  }
}
