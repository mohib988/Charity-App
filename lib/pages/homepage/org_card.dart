// ignore: avoid_web_libraries_in_flutter
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/ReduxStore/actions.dart';
import 'package:flutter_application_1/pages/drawer/drawer.dart';
import 'package:flutter_application_1/pages/homepage/components/org_card_builder.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:convert';

// import 'package:flutter_application_1/pages/org_signup_page.dart';

import '../../ReduxStore/states.dart';
import '../../ReduxStore/store.dart';
import '../../models/org.dart';

// ...

loadOrganizationList() async {
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
  // final store = StoreProvider.of<AppState>(context as BuildContext);
  // store.dispatch(SetOrganizationListAction(orgList));

  // Assign the list of organizations to the static items property of the OrganizationInfo class
  // print(store);
  // print(orgList[0].toJS);
  return orgList;
  // OrganizationInfo.items = orgList;
}

class OrganizationGrid extends StatefulWidget {
  @override
  State<OrganizationGrid> createState() => _OrganizationGridState();
}

class _OrganizationGridState extends State<OrganizationGrid> {
  @override
  Widget build(BuildContext context) {
    // return StoreConnector<AppState,List<OrganizationInfo>>(
    //   converter: (store)=>store.state.organizationList,

    return Scaffold(
      appBar: AppBar(
        title: Text('Organization Grid'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadOrganizationList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<OrganizationInfo> orgList =
                snapshot.data as List<OrganizationInfo>;
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: List.generate(orgList.length, (index) {
                return BuildCard(org: orgList[index]);
              }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      drawer: DrawerContainer(),
    );
  }
}
