/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:19 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 15:31:47
 */
part of 'new_business_bloc.dart';

abstract class NewBusinessEvent extends Equatable {
  const NewBusinessEvent();

  @override
  List<Object> get props => [];
}

class GetSousCategories extends NewBusinessEvent {
  const GetSousCategories();
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetSousCategories { }';
}
