import 'dart:convert';

import "package:flutter/material.dart";
import '../urls/urls.dart';

class User {
  String name;
  User(this.name);

  User.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User("");
  Map<String, dynamic> a = {"name": "mohib", "age": 34};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("mohib")),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                hintStyle: TextStyle(color: Colors.brown),

                // contentPadding: EdgeInsets.all(29.0),
              ),
              onChanged: (value) => {
                setState(() {
                  user.name = value;
                  print(user.name);
                })
              },

              // validator: (value) {
              //   if (value == null) {
              //     return "this is it";
              //   }
              //   return "this";
              // },
            ),
            ElevatedButton(
              onPressed: () {
                return login((user));
              },
              child: Text("login"),
              // jkdjfk
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
