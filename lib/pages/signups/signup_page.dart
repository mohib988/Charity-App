import 'package:flutter/material.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../models/sign_model.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];
GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
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

  late final SignupUser _user = SignupUser();

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
    var signupSession = SessionManager();
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
                  hint: Text(_user.userType),
                  dropdownColor: Theme.of(context).colorScheme.primary,
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
                  onPressed: () async {
                    // Implement signup logic here
                    print(_user.userType);
                    // userSignup(_user);
                    if (_user.userType == 'User') {
                      userSignup(() {
                        Navigator.pushNamed(context, "/home");
                      }, _user);
                    } else {
                      await signupSession.set("Org_signup_info", _user);
                      print(signupSession.get("Org_signup_info"));
                      Navigator.pushNamed(context, "/orgSignup");
                    }

                    // userSignup(() async {
                    //   if (_user.userType == "User") {
                    //   } else if (_user.userType == "Organization") {}
                    // }, _user);
                  },
                  child: _user.userType == 'User'
                      ? Text('Sign up')
                      : _user.userType == 'Organization'
                          ? Text('Next')
                          : null,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final GoogleSignInAccount? googleUser =
                              await _googleSignIn.signIn();
                          if (googleUser != null) {
                            // Successful sign in with Google
                            print(googleUser.email);
                          }
                        } catch (error) {
                          // Handle sign in error
                          print(error);
                        }
                      },
                      child: Text('Sign up with Google for user'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final GoogleSignInAccount? googleUser =
                            await _googleSignIn.signIn();
                        if (googleUser != null) {
                          // Successful sign in with Google
                          print(googleUser);
                          print("----------------");
                        }
                      },
                      child: Text('Sign up with Google for org'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/login");
                  },
                  child: Text("Go to login")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/orgSignup");
                  },
                  child: Text("Go to org")),
            ],
          ),
        ));
  }
}
