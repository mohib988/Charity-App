import 'dart:convert';
import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage/org_card.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'url_Class.dart';

  // @override
  // void initState() {
  //   setToken();
  // }
// APi client mein base url dalna rizwaz
final apiClient = ApiClient(
  baseUrl: 'http://192.168.43.121:8000',
  headers: {'Content-Type': 'application/json'},
);

final apiAuthClient =
    ApiAuthClient(baseUrl: 'http://192.168.43.121:8000', headers: {});

Future<void> login(Function navigateToOrganizationGrid, user) async {
  // Simulating an asynchronous login request
  await Future.delayed(Duration(seconds: 2));
  print("login");

  // Login logic here
  print(jsonEncode(user));
  apiClient.post('/dj-rest-auth/login/', user).then((value) {
    print(value.body.toString());
    print("status is ${value.statusCode}");
    if (value.statusCode == 200) {
      navigateToOrganizationGrid();
    }
  }).catchError((onError) => {print("error is $onError")});

  // Assuming login is successful
  print('passed login request part!');

  // Redirect to the next screen using .then
}

//login(value) {}

Future<void> userSignup(Function navigateToHomepage, user) async {
  // Simulating an asynchronous login request
  await Future.delayed(Duration(seconds: 2));
  print("signup");

  // Login logic here
  apiClient.post('/dj-rest-auth/registration/', user).then((value) {
    //   print(jsonEncode(value));
    print("status is ${value.statusCode}");
    if (value.statusCode == 204) {
      navigateToHomepage();
    }
  });

  // Assuming login is successful
  print('Signup successful!');

  // Redirect to the next screen using .then
}

Future<void> orgSignup(Function sendOrgCred, Function navigateToProfile, orginfo) async {
  // Simulating an asynchronous login request
  await Future.delayed(Duration(seconds: 2));
  print("orgsignup");
  Map<String, dynamic> data = await sendOrgCred();

  print("DATA IS ${jsonEncode(data)}");
  // Login logic here
  var response = await apiClient.post('/dj-rest-auth/registration/', data);
  print(response.body.toString());
  print("status is ${response.statusCode}");

  if (response.statusCode == 204) {
    var loginInfo = {
      'username': data['username'],
      'email': data['email'],
      'password': data['password1']
    };
    print('logininfo is $loginInfo');
    var autoLoginRequest =
        await apiClient.post('/dj-rest-auth/login/', loginInfo);
    print('auto login value is ${autoLoginRequest.body.toString()}');
    print("auto login status is ${autoLoginRequest.statusCode}");
//       if (value.statusCode == 200) {
// //        navigateToOrganizationGrid();
//       }
    // Parse the response body as JSON
    dynamic jsonData = jsonDecode(autoLoginRequest.body);

    // Retrieve the value associated with the key 'token'
    String token = jsonData['key'];


    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token as String);
    print('in urls ${prefs.getString('authToken')}');



    print('i am in urls and this is your token $token'); // Output: The token value
//    var val = autoLoginRequest['key'];
//    var authToken = autoLoginRequest.key;
    // var user = await apiAuthClient.get('/dj-rest-auth/user/',
    //     {'Content-Type': 'application/json', 'Authorization': 'Token $token'});
    // print('user is ${user.body.toString()}');

    // print('this is ${jsonEncode(orginfo)}');
    orginfo.user = data['email'];
    print('this is updated orginfo ${jsonEncode(orginfo)}');
    var org_signup_response = await apiClient.post('/orgsignup/', orginfo);
    print(org_signup_response.body.toString());
    print("status is ${org_signup_response.statusCode}");
    if (org_signup_response.statusCode == 200){
      navigateToProfile();
    }
  }

  // Assuming login is successful
  print('Signup successful!');

  // Redirect to the next screen using .then
}

// userSignup(value) {
//   print("signup");
//   return apiClient.post('/dj-rest-auth/registration/', value);
// }
