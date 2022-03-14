/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 22:18:12 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-03-13 15:37:16
 */
part of 'new_business_bloc.dart';

abstract class NewBusinessState extends Equatable {
  const NewBusinessState();

  @override
  List<Object> get props => [];
}

class NewBusinessInitial extends NewBusinessState {}

class PageLoading extends NewBusinessState {}

class SousCategoriesLoaded extends NewBusinessState {
  final List<Datum> sousCategories;

  const SousCategoriesLoaded(this.sousCategories);
  @override
  List<Object> get props => [sousCategories];

  @override
  String toString() =>
      'SousCategoriesLoaded { sousCategories: $sousCategories }';
}
