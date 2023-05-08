import 'dart:convert';

import "package:flutter/material.dart";
import '../urls/urls.dart';
import 'package:http/http.dart' as http;

class User {
  String name;
  String password;
  User(this.name, this.password);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        password = json['password'];
  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
      };
}

Future<http.Response> greet(String name) {
  var map = {'name': name};
  return http.post(
    Uri.parse('http://localhost:8000/'),
    body: map,
  );
}

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User("", "");
  Map<String, dynamic> a = {"name": "mohib", "age": 34};
  final _textFieldController = TextEditingController();
  final _buttonController = MaterialStatesController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mohib")),
      body: Center(
        heightFactor: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Text("M"),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Enter your name",
                  hintStyle: TextStyle(color: Colors.brown),
                  contentPadding: EdgeInsets.all(29.0),
                ),
                onChanged: (value) => {
                  setState(
                    () {
                      user.name = value;
                      print(user.name);
                    },

                    // validator: (value) {
                    //   if (value == null) {
                    //     return "this is it";
                    //   }
                    //   return "this";
                    // },
                  ),
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "Enter your Password",
                  hintStyle: TextStyle(color: Colors.brown),
                  contentPadding: EdgeInsets.all(29.0),
                ),
                onChanged: (value) => {
                  setState(
                    () {
                      user.password = value;
                      print(user.password);
                    },

                    // validator: (value) {
                    //   if (value == null) {
                    //     return "this is it";
                    //   }
                    //   return "this";
                    // },
                  ),
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              statesController: _buttonController,
              onPressed: () {
                AlertDialog(
                  content: Text(_textFieldController.text),
                );
                //    return login((user));
              },
              child: Text("Login"),
              onHover: (value) => {print(_buttonController.value)},
            )
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}

                // greet(_textFieldController.text).then((response) => showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         content: Text(response.body.toString()),
                //       );
                //     },
                //   ));