import "package:flutter/material.dart";
import '../../models/user.dart';
import '../../urls/urls.dart';

class LoginPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User user = User("", "", "");
  Map<String, dynamic> a = {"name": "mohib", "age": 34};
  // final _textFieldController = TextEditingController();
  final _buttonController = MaterialStatesController();

  Function(dynamic value)? _getOnChangedFunction(String type) {
    final fieldMap = {
      'username': (value) => user.username = value,
      'email': (value) => user.email = value,
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
            SizedBox(
              height: 10,
            ),
            _buildTextField(
              type: 'password',
              label: 'Password',
              placeholder: 'Enter your password',
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              statesController: _buttonController,
              onPressed: () {
// Call the login function and provide the navigateToOrganizationGrid callback
                login(() {
                  Navigator.pushNamed(context, "/home");
                }, user);
              },
              child: Text("Login"),
              onHover: (value) => {print(_buttonController.value)},
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/signup");
            },
            child: Text("Go to signup")),
      ),
      drawer: Drawer(),
    );
  }
}
