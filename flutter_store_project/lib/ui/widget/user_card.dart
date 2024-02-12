import 'package:flutter/material.dart';
import 'package:flutter_store_project/blocs/user/user_bloc.dart';
import 'package:flutter_store_project/models/user_response/user_response.dart';
import 'package:flutter_store_project/ui/pages/user_detail_page.dart';

class CardUser extends StatelessWidget {
  final UserResponse user;
  final int index;

  const CardUser({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    int delay = 100 * index;
    return SizedBox(
      width: 150,
      height: 300,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetailsPage(
                      userId: user.id!,
                    )),
          );
        },
        child: Card(
          child: ClipRRect(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
