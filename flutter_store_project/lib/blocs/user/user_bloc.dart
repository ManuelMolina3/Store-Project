import 'package:bloc/bloc.dart';
import 'package:flutter_store_project/models/user_response/user_response.dart';
import 'package:flutter_store_project/repositories/user/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final UserRepository repository;

  UserBlocBloc(this.repository) : super(UserBlocInitial()) {
    on<UserFetchList>(_onUserFetchList);
  }
  void _onUserFetchList(
      UserFetchList event, Emitter<UserBlocState> emit) async {
    try {
      final userList = await repository.fetchUsers();
      emit(UserFetchSuccess(userList));
      return;
    } on Exception catch (e) {
      emit(UserFetchError(e.toString()));
    }
  }
}
