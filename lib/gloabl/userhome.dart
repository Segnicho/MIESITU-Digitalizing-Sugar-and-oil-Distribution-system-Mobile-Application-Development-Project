import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labpract/application/auth/bloc/auth_bloc.dart';
import 'package:labpract/application/auth/events/auth_events.dart';

class UserHome extends StatefulWidget {
  UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(title: Text("User Home welcome")),

        body: ListView(children: [
      ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
          },
          child: const Text("Logout"))
    ])

        // bottomNavigationBar: BottomNavigationBar(items:
        // ]),

        );
  }
}
