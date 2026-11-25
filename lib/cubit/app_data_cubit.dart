import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/app_data_repository.dart';
import 'app_data_state.dart';

class AppDataCubit extends Cubit<AppDataState> {
  final AppDataRepository repository;

  AppDataCubit(this.repository) : super(AppDataLoading());

  Future<void> loadData() async {
    emit(AppDataLoading());

    try {
      final data = await repository.loadData();

      if (data.isEmpty) {
        emit(AppDataEmpty());
      } else {
        emit(AppDataSuccess(data));
      }
    } catch (e) {
      emit(AppDataError(e.toString()));
    }
  }
}