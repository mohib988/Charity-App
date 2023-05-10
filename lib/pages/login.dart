import 'dart:convert';

import "package:flutter/material.dart";
import '../urls/urls.dart';
import 'package:http/http.dart' as http;

class User {
  String username;
  String email;
  String password;
  User(this.username, this.email, this.password);

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
      email = json['email'],
        password = json['password'];
  Map<String, dynamic> toJson() => {
        'username':username,'email': email,
        'password': password,
      };
}

// Future<http.Response> greet(String email) {
//   var map = {'email': email};
//   return http.post(
//     Uri.parse('http://localhost:8000/'),
//     body: map,
//   );
// }

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User("","", "");
  Map<String, dynamic> a = {"name": "mohib", "age": 34};
  // final _textFieldController = TextEditingController();
  final _buttonController = MaterialStatesController();

  Function(dynamic value)? _getOnChangedFunction(String type) {
    final fieldMap = {

      'username': (value) => user.username = value,
      'email':(value) => user.email = value,
      'password': (value) => user.password = value,
    };
    return fieldMap[type];
  }

  Widget _buildTextField(
      {required String type,
      required String label,
      required String placeholder}) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          hintText: placeholder,
        ),
        onChanged: _getOnChangedFunction(type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
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
            _buildTextField(
              type: 'username',
              label: 'Username',
              placeholder: 'Enter your username',
            ),

            SizedBox(
              height: 10,
            ),
            _buildTextField(
              type: 'email',
              label: 'Email',
              placeholder: 'Enter your email',
            ),
            
            // SizedBox(
            //   width: 300,
            //   child: TextFormField(
            //     controller: _textFieldController,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey)),
            //       hintText: "Enter your email",
            //       hintStyle: TextStyle(color: Colors.brown),
            //       contentPadding: EdgeInsets.all(29.0),
            //     ),
            //     onChanged: (value) => {
            //       setState(
            //         () {
            //           user.email = value;
            //           print(user.email);
            //         },

            //         // validator: (value) {
            //         //   if (value == null) {
            //         //     return "this is it";
            //         //   }
            //         //   return "this";
            //         // },
            //       ),
            //     },
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            _buildTextField(
              type: 'password',
              label: 'Password',
              placeholder: 'Enter your password',
            ),
            // SizedBox(
            //   width: 300,
            //   child: TextFormField(
            //     controller: _textFieldController,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.grey)),
            //       hintText: "Enter your Password",
            //       hintStyle: TextStyle(color: Colors.brown),
            //       contentPadding: EdgeInsets.all(29.0),
            //     ),
            //     onChanged: (value) => {
            //       setState(
            //         () {
            //           user.password = value;
            //           print(user.password);
            //         },

            //         // validator: (value) {
            //         //   if (value == null) {
            //         //     return "this is it";
            //         //   }
            //         //   return "this";
            //         // },
            //       ),
            //     },
            //   ),
            // ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              statesController: _buttonController,
              onPressed: () {
                // AlertDialog(
                //   content: Text(_textFieldController.text),
                // );
                login((user));
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