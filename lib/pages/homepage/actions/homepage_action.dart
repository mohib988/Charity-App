import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../ReduxStore/actions.dart';
import '../../../ReduxStore/states.dart';
import '../../../models/org.dart';

loadOrganizationList(BuildContext context) async {
  // Wait for 2 seconds to simulate a delay (for testing purposes)
  await Future.delayed(Duration(seconds: 2));

  // Load the JSON data from the asset file
  final jsonString =
      await rootBundle.loadString('experimentalData/rawdata.json');
  final jsonMap = jsonDecode(jsonString);

  // Extract the list of organizations from the JSON data
  final orgData = jsonMap['organization'] as List<dynamic>;

  // Convert each JSON object to an instance of the OrganizationInfo class
  final orgList = orgData
      .map<OrganizationInfo>((json) => OrganizationInfo.fromJson(json))
      .toList();

  final store = StoreProvider.of<AppState>(context);
  store.dispatch(SetOrganizationListAction(orgList));

  // Assign the list of organizations to the static items property of the OrganizationInfo class
  print(store.state.organizationList[0].country);
  // print(orgList[0].toJS);
  return orgList;
  // OrganizationInfo.items = orgList;
}
