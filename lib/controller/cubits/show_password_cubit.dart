import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPasswordCubit extends Cubit<bool> {
  ShowPasswordCubit({bool? hidePassword}) : super(hidePassword = true);

  void hidePassword() {
    emit(!state);
  }
}
