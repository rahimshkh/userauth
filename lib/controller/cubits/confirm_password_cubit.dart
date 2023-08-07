import 'package:flutter_bloc/flutter_bloc.dart';

class ShowConfirmPasswordCubit extends Cubit<bool> {
  ShowConfirmPasswordCubit({bool? hidePassword}) : super(hidePassword = true);

  void hidePassword() {
    emit(!state);
  }
}
