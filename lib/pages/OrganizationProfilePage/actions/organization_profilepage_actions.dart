import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/ReduxStore/actions.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../ReduxStore/states.dart';
import '../../../models/org.dart';

// loadProfile(BuildContext context) async {
//   await Future.delayed(Duration(seconds: 2));
//   final store = StoreProvider.of<AppState>(context);
//   return store.state.currentOrganization;
// }

loadProfile(BuildContext context) async {
  final store = StoreProvider.of<AppState>(context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('authToken');
    print(prefs.getString('authToken'));

  // Make an API request to fetch the organization profile data
  final response = await apiAuthClient.get('/organizations', {'Content-Type': 'application/json', 'Authorization': 'Token $token'});
  print(response.body.toString());
  if (response.statusCode == 200) {
    // Parse the response JSON data
    final responseData = jsonDecode(response.body);
    
    // Create an instance of OrganizationInfo using the fetched data
    final organizationInfo = OrganizationInfo.fromJson(responseData);
    
    // Update the currentOrganization in the app state
    store.dispatch(SetOrganizationAction(organizationInfo));
    
    // Return the organizationInfo
    return organizationInfo;
  } else {
    throw Exception('Failed to fetch organization profile');
  }
}
