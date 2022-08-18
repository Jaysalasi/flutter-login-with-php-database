// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'homepage.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController _email;
  late TextEditingController _password;

  startRegister() async {
    String apiUrl = "http://192.168.154.2/test/register.php";

    final response = await http.post(Uri.parse(apiUrl), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      try {
        final jsonData = await json.decode(response.body);

        if (jsonData == "registration successful") {
          // print("username exists");
          print("Success");
          print(jsonData);
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Login()));
        } else {
          print("user exist");
        }
      } catch (e) {
        print("something happened");
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
        appBar: AppBar(title: const Text('Register Page')),
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
                  // HttpService().Register;
                  startRegister();
                  // print(email);
                },
                child: const Text(
                  "Register",
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
