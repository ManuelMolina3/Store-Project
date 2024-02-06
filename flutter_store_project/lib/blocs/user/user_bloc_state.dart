part of 'user_bloc_bloc.dart';

@immutable
sealed class UserBlocState {
  final List<UserResponse> users;

  const UserBlocState({
    this.users = const <UserResponse>[],
  });
}

final class UserBlocInitial extends UserBlocState {}

final class UserFetched extends UserBlocState {
  final List<UserResponse> usersList;
  const UserFetched(this.usersList);
}

final class UserFetchError extends UserBlocState {
  final String errorMessage;
  const UserFetchError(this.errorMessage);
}
