/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-20 14:45:24 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-01-20 14:45:24 
 */
part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsAndPermissionEvent extends GpsEvent {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  const GpsAndPermissionEvent(
      {required this.isGpsEnabled, required this.isGpsPermissionGranted});
}
