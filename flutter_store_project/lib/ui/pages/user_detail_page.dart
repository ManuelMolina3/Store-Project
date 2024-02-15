import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  final int userId;
  const UserDetailsPage({super.key, required this.userId});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
