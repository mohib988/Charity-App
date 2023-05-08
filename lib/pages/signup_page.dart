import 'package:flutter/material.dart';
import 'package:flutter_application_1/urls/urls.dart';

class SignupUser {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String userType = ''; // added userType field

  SignupUser({
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.userType = '', // added userType initialization
  });

  factory SignupUser.fromJson(Map<String, dynamic> json) {
    return SignupUser(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      userType: json['userType'] ?? '', // added userType initialization
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['userType'] = userType; // added userType serialization
    return data;
  }
}

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  late final SignupUser _user = SignupUser();

  Function(dynamic value)? _getOnChangedFunction(String type) {
    final fieldMap = {
      'name': (value) => _user.name = value,
      'email': (value) => _user.email = value,
      'password': (value) => _user.password = value,
      'confirmPassword': (value) => _user.confirmPassword = value,
      'userType': (value) =>
          _user.userType = value, // added userType field mapping
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
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                child: Text("Child"),
              ),
              SizedBox(height: 30.0),
              _buildTextField(
                type: 'name',
                label: 'Name',
                placeholder: 'Enter your name',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'email',
                label: 'Email',
                placeholder: 'Enter your email',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'password',
                label: 'Password',
                placeholder: 'Enter your password',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'confirmPassword',
                label: 'Confirm Password',
                placeholder: 'Confirm your password',
              ),
              SizedBox(height: 26.0),
              ElevatedButton(
                onPressed: () {
                  // Implement signup logic here
                  userSignup(_user.userType);
                },
                child: Text('Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
