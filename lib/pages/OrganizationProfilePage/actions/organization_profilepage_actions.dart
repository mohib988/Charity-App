import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/urls/urls.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/ReduxStore/actions.dart';
import 'package:flutter_application_1/ReduxStore/states.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/org.dart';

Future<OrganizationInfo> loadProfile(BuildContext context) async {
  final store = StoreProvider.of<AppState>(context);
  store.dispatch(SetIsLoadingAction(false));

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('authToken');
  print("this is token in orgprofact ${prefs.getString('authToken')}");

  try {
    // Make an API request to fetch the organization profile data
    final response = await apiAuthClient.get(
      '/organizations',
      {
        'Content-Type': 'application/json',
        'Authorization': 'Token $token',
      },
    );

    if (response.statusCode == 200) {
      // Parse the response JSON data
      final responseData = jsonDecode(response.body);

      // Create an instance of OrganizationInfo using the fetched data
      final organizationInfo = OrganizationInfo.fromJson(responseData);
      print("this is orginfo in org profpage action $organizationInfo");

      // Update the currentOrganization in the app state
      store.dispatch(SetOrganizationAction(organizationInfo));

      // Return the organizationInfo
      return organizationInfo;
    } else {
      throw Exception('Failed to fetch organization profile');
    }
  } catch (e) {
    print(e.toString());
    throw Exception('Failed to fetch organization profile');
  }
}
