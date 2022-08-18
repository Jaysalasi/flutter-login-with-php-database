// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginApi/pages/homepage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _email;
  late TextEditingController _password;

  startLogin() async {
    String apiUrl = "http://192.168.154.2/test/logic.php";

    final response = await http.post(Uri.parse(apiUrl), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      try {
        final jsonData = await json.decode(response.body);

        if (jsonData == "success") {
          // print("username exists");
          print("Success");
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          print("wrong email and password");
        }
      } catch (e) {
        print("something supped");
        print(e);
      }
    } else {
      print("connection error");
    }
  }

  late String email;
  late String password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    email = "";
    password = "";

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              TextField(
                controller: _email,
                // style: const TextStyle(
                //   color: Colors.white,
                // ),
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) {
                  email = value;
                },
              ),

              // password

              TextField(
                controller: _password,
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.visiblePassword,
                enableSuggestions: false,
                autocorrect: false,
                obscureText: true,
                // style: const TextStyle(
                //   color: Colors.white,
                // ),
              ),

              // button

              TextButton(
                onPressed: () async {
                  // Logic();
                  // HttpService().login;
                  startLogin();
                  // print(email);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Color(0xff1B277E)),
                ),
              ),
            ],
          ),
        )
        // ignore: avoid_unnecessary_containers
        );
  }
}
