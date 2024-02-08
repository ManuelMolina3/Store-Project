import 'package:bloc/bloc.dart';
import 'package:flutter_store_project/models/user_response/user_response.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(UserBlocInitial()) {
    on<UserBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
