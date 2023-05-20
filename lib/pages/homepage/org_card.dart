// ignore: avoid_web_libraries_in_flutter
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/drawer/drawer.dart';
import 'package:flutter_application_1/pages/homepage/components/org_card_builder.dart';

// import 'package:flutter_application_1/pages/org_signup_page.dart';

import '../../models/org.dart';
import 'actions/homepage_action.dart';

// ...

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
        future: loadOrganizationList(context),
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
