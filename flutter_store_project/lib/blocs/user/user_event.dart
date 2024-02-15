part of 'user_bloc.dart';

@immutable
sealed class UserBlocEvent {}

class UserFetchList extends UserBlocEvent {
  UserFetchList();
}

class UserViewDetail extends UserBlocEvent {
  final int userId;
  UserViewDetail(this.userId);
}
