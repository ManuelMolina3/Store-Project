part of 'user_bloc_bloc.dart';

@immutable
sealed class UserBlocState {}

final class UserBlocInitial extends UserBlocState {}

final class UserFetchSuccess extends UserBlocState {
  final List<UserResponse> usersList;
  UserFetchSuccess(this.usersList);
}

final class UserFetchError extends UserBlocState {
  final String errorMessage;
  UserFetchError(this.errorMessage);
}
