import 'dart:convert';

import "package:flutter/material.dart";
import '../urls/urls.dart';
import 'package:http/http.dart' as http;

class User {
  String name;
  User(this.name);

  User.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
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
  User user = User("");
  Map<String, dynamic> a = {"name": "mohib", "age": 34};
  final _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mohib")),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle: TextStyle(color: Colors.brown),

                // contentPadding: EdgeInsets.all(29.0),
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
            ElevatedButton(
              onPressed: () {
                greet(_textFieldController.text).then((response) => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(response.body.toString()),
                      );
                    },
                  ));
                //    return login((user));
              },
              child: Text("Login"),
              //                 onHover: (){
              // Color.BfromARGB(,
              //                       },
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }
}
