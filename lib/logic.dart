import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loginApi/pages/homepage.dart';

import 'package:http/http.dart' as http;

class HttpService {
  late String email;
  late String password;

  late TextEditingController _email;
  late TextEditingController _password;
  // @override
  // void initState() {
  //   email = "";
  //   password = "";
  //   super.initState();
  // }

  String loginApiUrl = "http://192.168.154.2/test/logic.php";

  String registerApiUrl = "http://192.168.154.2/test/register.php";

  login() async {
    final response = await http.post(Uri.parse(loginApiUrl), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      try {
        final jsonData = await json.decode(response.body);

        if (jsonData == "success") {
          // print("username exists");
          print("Success");
          // await Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } catch (e) {
        print("something supped");
        print(e);
      }
    } else {
      throw Exception("connection error");
      // print("connection error");
      // return const Text("connection error");
    }
  }

  register() async {
    final response = await http.post(Uri.parse(registerApiUrl), body: {
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      try {
        final jsonData = await json.decode(response.body);

        if (jsonData == "success") {
          // print("username exists");
          print("Success");
          // await Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } catch (e) {
        print("something supped");
        print(e);
      }
    } else {
      throw Exception("connection error");
    }
  }
}
