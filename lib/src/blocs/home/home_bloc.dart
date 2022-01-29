/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 21:01:25 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-28 16:57:48
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/src/repositories/tracking/trackingRepository.dart';
import 'package:positioncollect/src/utils/result.dart';

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
      } else if (trackingResult.error is NoInternetError) {
        return emit(HomeNoInternet());
      }
    } catch (_) {
      return emit(HomeError());
    }
  }
}
