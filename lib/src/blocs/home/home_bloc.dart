/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 21:01:25 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 06:15:38
 */
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:positioncollect/src/models/tracking_model/data.dart';
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
      Data tracking = Data(
          longitude: position.longitude.toString(),
          latitude: position.latitude.toString());

      final trackingResult = await trackingRepository!.addtracking(tracking);

      if (trackingResult.success!.success!) {
        return emit(HomeLocation(position));
      } else if (trackingResult.error is NoInternetError) {
        return emit(HomeNoInternet());
      }
    } catch (e) {
      return emit(HomeError());
    }
  }
}
