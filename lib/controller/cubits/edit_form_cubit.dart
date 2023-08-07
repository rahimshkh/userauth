import 'package:flutter_bloc/flutter_bloc.dart';

class EditFormCubit extends Cubit <bool>{
  EditFormCubit({bool? enabled}) : super(enabled = false);

  void editForm() {
    emit(!state);
  }
}
