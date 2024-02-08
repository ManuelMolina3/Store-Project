part of 'user_bloc.dart';

@immutable
sealed class UserBlocEvent {}

class UserFetchList extends UserBlocEvent {
  final String type;
  UserFetchList(this.type);
}

class UserViewDetail extends UserBlocEvent {
  final int userId;
  UserViewDetail(this.userId);
}
