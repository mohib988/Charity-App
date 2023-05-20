import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage/org_card.dart';

import 'url_Class.dart';

// APi client mein base url dalna rizwaz
final apiClient = ApiClient(
  baseUrl: 'http://localhost:8000',
  headers: {'Content-Type': 'application/json'},
);

Future<void> login(Function navigateToOrganizationGrid, user) async {
  // Simulating an asynchronous login request
  await Future.delayed(Duration(seconds: 2));
  print("login");

  // Login logic here
  apiClient.post('/dj-rest-auth/login/', user).then((value) {
    print(value);
    print("status is ${value.statusCode}");
    if (value.statusCode == 200) {
      navigateToOrganizationGrid();
    }
  });

  // Assuming login is successful
  print('Login successful!');

  // Redirect to the next screen using .then
}

//login(value) {}

Future<void> userSignup(Function navigateToHomepage, user) async {
  // Simulating an asynchronous login request
  await Future.delayed(Duration(seconds: 2));
  print("signup");

  // Login logic here
  apiClient.post('/dj-rest-auth/registration/', user).then((value) {
    print(value);
    print("status is ${value.statusCode}");
    if (value.statusCode == 204) {
      navigateToHomepage();
    }
  });

  // Assuming login is successful
  print('Signup successful!');

  // Redirect to the next screen using .then
}

// userSignup(value) {
//   print("signup");
//   return apiClient.post('/dj-rest-auth/registration/', value);
// }
