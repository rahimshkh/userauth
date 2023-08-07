import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/constants/custom_strings.dart';
import '../../../helper/utils/hive_utils.dart';
import '../../../models/user_model.dart';

part 'hive_events.dart';

part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvents, HiveState> {
  HiveBloc() : super(const HiveState()) {
    on<FetchDataEvent>(onFetchDataEvent);
    on<UpdateDataEvent>(onUpdateDataEvent);
  }

  onFetchDataEvent(FetchDataEvent event, Emitter<HiveState> emit) {
    Map<String, dynamic> userMap = HiveStorageManager.getUserData();
    if (userMap.isNotEmpty) {
      UserModel user = UserModel.fromJson(userMap);
      emit(state.copyWith(status: HiveStatus.fetched, user: user));
    } else {
      emit(state.copyWith(status: HiveStatus.failed, alert: AppStrings.kInvalidError));
    }
  }

  onUpdateDataEvent(UpdateDataEvent event, Emitter<HiveState> emit) {
    emit(state.copyWith(status: HiveStatus.loading));
    HiveStorageManager.updateUserName(event.name);
    emit(state.copyWith(
        status: HiveStatus.updated, alert: AppStrings.kUpdatedSuccessfully));
    add(FetchDataEvent());
  }
}
