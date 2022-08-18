import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: TextButton(
        child: const Text('logout'),
        onPressed: () {
          // authenticationBloc.dispatch(LoggedOut());
        },
      )),
    );
  }
}
