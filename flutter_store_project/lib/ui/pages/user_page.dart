import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_store_project/blocs/user/user_bloc.dart';
import 'package:flutter_store_project/repositories/user/user_repository.dart';
import 'package:flutter_store_project/repositories/user/user_repository_impl.dart';
import 'package:flutter_store_project/ui/widgets/user_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserRepository repository;
  late UserBlocBloc _userBloc;
  String title = 'Users';

  @override
  void initState() {
    repository = UserRepositoryImpl();
    _userBloc = UserBlocBloc(repository)..add(UserFetchList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _userBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _userList(),
      ),
    );
  }

  Widget _userList() {
    return BlocBuilder<UserBlocBloc, UserBlocState>(
      builder: (context, state) {
        if (state is UserFetchSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7, mainAxisSpacing: 5.0),
            itemCount: state.usersList.length,
            itemBuilder: (context, index) {
              final user = state.usersList[index];
              return CardUser(user: user, index: index);
            },
          );
        } else if (state is UserFetchError) {
          return Text(state.errorMessage);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
