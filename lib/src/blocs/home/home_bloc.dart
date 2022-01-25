/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 21:01:25 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-24 13:37:31
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/src/repositories/position/tracking/trackingRepository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TrackingRepository? trackingRepository;
  HomeBloc({this.trackingRepository}) : super(HomeInitial()) {
    on<HomeGetLocation>(_homeGetLocation);
  }

  void _homeGetLocation(
    HomeGetLocation event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      Position position = await Geolocator.getCurrentPosition();
      final trackingResult = await trackingRepository!.addtracking(
          position.longitude.toString(), position.latitude.toString());
      if (trackingResult.success!.success!) {
        return emit(HomeLocation(position));
      }
    } catch (_) {
      return emit(HomeError());
    }
  }
}
