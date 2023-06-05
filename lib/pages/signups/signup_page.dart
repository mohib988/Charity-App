import 'package:flutter/material.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  void initState() {
    setOrg();
    super.initState();
  }

  setOrg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Username', _user.username);
    prefs.setString('Email', _user.email);
    prefs.setString('Password1', _user.password);
    prefs.setString('Password2', _user.confirmPassword);
    prefs.setString('Usertype', _user.userType);
    print("USER IS $_user");
  }

  Widget _buildTextField(
      {required String type,
//      required String label,
      required String placeholder}) {
  return Container(
  padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
  decoration: BoxDecoration(
    
    borderRadius: BorderRadius.circular(50.0), // Set desired border radius value
    border: Border.all(color: Colors.black54, width: 2.0),
  ),
  child: TextFormField(
    decoration: InputDecoration(
//      labelText: label,
//       labelStyle: TextStyle(
// //        fontStyle: FontStyle.italic,
//         color: Colors.grey,
//       ),
      border: InputBorder.none, // Remove default input field border
      hintText: placeholder,
      hintStyle: TextStyle(
//        fontStyle: FontStyle.italic,
        color: Colors.grey,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
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
        padding: EdgeInsets.all(0.0),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    child: Text("Child"),

                  ),
                  SizedBox(height: 10.0),
                  _buildTextField(
                    type: 'username',
  //                  label: 'Username',
                    placeholder: 'Enter username',
                  ),
                  SizedBox(height: 8.0),
                  _buildTextField(
                    type: 'email',
    //                label: 'Email',
                    placeholder: 'Enter email',
                  ),
                  SizedBox(height: 8.0),
                  _buildTextField(
                    type: 'password',
     //               label: 'Password',
                    placeholder: 'Enter password',
                  ),
                  SizedBox(height: 8.0),
                  _buildTextField(
                    type: 'confirmPassword',
      //              label: 'Confirm Password',
                    placeholder: 'Confirm password',
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
                      });
                    },
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () async {
                      print(_user.userType);
                      if (_user.userType == 'User') {
                        userSignup(() {
                          Navigator.pushNamed(context, "/home");
                        }, _user);
                      } else {
                        await setOrg();
                        Navigator.pushNamed(context, "/orgSignup");
                      }
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
                              print(googleUser.email);
                            }
                          } catch (error) {
                            print(error);
                          }
                        },
                        child: Text('Sign up with Google'),
                      ),
                      // ElevatedButton(
                      //   onPressed: () async {
                      //     final GoogleSignInAccount? googleUser =
                      //         await _googleSignIn.signIn();
                      //     if (googleUser != null) {
                      //       print(googleUser);
                      //       print("----------------");
                      //     }
                      //   },
                      //   child: Text('Sign up with Google for org'),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/login");
              },
              child: Text("Go to login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/orgSignup");
              },
              child: Text("Go to org"),
            ),
          ],
        ),
      ),
    );
  }
}
