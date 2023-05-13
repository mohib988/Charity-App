import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/drawer.dart';
import 'dart:convert';

// import 'package:flutter_application_1/pages/org_signup_page.dart';

import '../models/org.dart';

// ...

loadData() async {
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

  // Assign the list of organizations to the static items property of the OrganizationInfo class
  print(orgList[0].id);
  return orgList;
  // OrganizationInfo.items = orgList;
}

class OrganizationGrid extends StatefulWidget {
  @override
  State<OrganizationGrid> createState() => _OrganizationGridState();
}

class _OrganizationGridState extends State<OrganizationGrid> {
  Widget _buildCard(OrganizationInfo org) {
    Color borderColor = Colors.amber;

    return InkWell(
      autofocus: true,
      focusColor: Colors.amber,

      onTap: () {
        borderColor = Colors.amber;
      },
      highlightColor: Colors.amber,
      // onHighlightChanged: (isHi),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 6,
        child: Container(
          // color: borderColor.value,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  org.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 120,
                child: Image.network(
                  org.image.path,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                org.mission,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organization Grid'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<OrganizationInfo> orgList =
                snapshot.data as List<OrganizationInfo>;
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: List.generate(orgList.length, (index) {
                return _buildCard(orgList[index]);
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
