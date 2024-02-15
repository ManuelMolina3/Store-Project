import 'package:flutter/material.dart';
import 'package:flutter_store_project/models/user_response/user_response.dart';
import 'package:flutter_store_project/ui/pages/user_detail_page.dart';
import 'package:flip_card/flip_card.dart';

class CardUser extends StatelessWidget {
  final UserResponse user;
  final int index;

  const CardUser({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context) {
    int delay = 100 * index;
    return SizedBox(
      width: 150,
      height: 200,
      child: GestureDetector(
          child: FlipCard(
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        side: CardSide.FRONT, // The side to initially display.
        front: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                            "${user.name!.firstname} ${user.name!.lastname}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text(user.email!),
                      Text(user.phone!),
                      Text(user.address!.street!)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        back: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                            "${user.name!.firstname} ${user.name!.lastname}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text(user.email!),
                      Text(user.phone!),
                      Text(user.address!.street!)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
