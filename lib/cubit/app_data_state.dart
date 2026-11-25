abstract class AppDataState {}

class AppDataLoading extends AppDataState {}

class AppDataSuccess extends AppDataState {
  final Map<String, dynamic> data;

  AppDataSuccess(this.data);
}

class AppDataEmpty extends AppDataState {}

class AppDataError extends AppDataState {
  final String message;

  AppDataError(this.message);
}