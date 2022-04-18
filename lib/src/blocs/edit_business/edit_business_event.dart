part of 'edit_business_bloc.dart';

abstract class EditBusinessEvent extends Equatable {
  const EditBusinessEvent();

  @override
  List<Object> get props => [];
}

class UpdateBatiment extends EditBusinessEvent {
  final Data batiment;
  final String? imagePath;
  const UpdateBatiment(this.batiment, {this.imagePath});
  @override
  List<Object> get props => [batiment, imagePath!];

  @override
  String toString() =>
      'UpdateBatiment { Batiment :$batiment,ImagePath: $imagePath}';
}
