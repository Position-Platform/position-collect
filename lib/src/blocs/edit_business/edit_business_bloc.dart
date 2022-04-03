import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_business_event.dart';
part 'edit_business_state.dart';

class EditBusinessBloc extends Bloc<EditBusinessEvent, EditBusinessState> {
  EditBusinessBloc() : super(EditBusinessInitial()) {
    on<EditBusinessEvent>((event, emit) {});
  }
}
