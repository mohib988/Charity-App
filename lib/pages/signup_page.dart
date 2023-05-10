import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/urls/urls.dart';

class SignupUser {
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String userType = ''; // added userType field

  SignupUser({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.userType = '', // added userType initialization
  });

  factory SignupUser.fromJson(Map<String, dynamic> json) {
    return SignupUser(
      username: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      userType: json['userType'] ?? 'User', // added userType initialization
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['password1'] = password;
    data['password2'] = confirmPassword;
    data['user_type'] = userType; // added userType serialization
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
      'username': (value) => _user.username = value,
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
                type: 'username',
                label: 'Username',
                placeholder: 'Enter your username',
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
              SizedBox(height: 8.0),
              DropdownButton(
                items: [
                  DropdownMenuItem(value: "User", child: Text("User")),
                  DropdownMenuItem(
                    value: "Organization",
                    child: Text("Organization"),
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      _user.userType = value;
                    }
                    // _user.userType = value;
                  });
                },
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Implement signup logic here
                  print(_user.userType);
                  userSignup(_user);
                },
                child: Text('Sign up'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text("Go to login"))
            ],
          ),
        ),
      ),
    );
  }
}
