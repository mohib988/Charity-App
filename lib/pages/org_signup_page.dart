import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/pages/avatar_picker.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/urls/urls.dart';

import '../models/org.dart';
import '../urls/UrlForPics/url_for_picture.dart';

class OrganizationSignupPage extends StatefulWidget {
  @override
  OrganizationSignupPageState createState() => OrganizationSignupPageState();
}

class OrganizationSignupPageState extends State<OrganizationSignupPage> {
  late final OrganizationInfo _organization = OrganizationInfo(image: File(""));

  Function(dynamic value)? _getOnChangedFunction(String type) {
    final fieldMap = {
      'name': (value) => _organization.name = value,
      'address': (value) => _organization.address = value,
      'country': (value) => _organization.country = value,
      'mission': (value) => _organization.mission = value,
      'description': (value) => _organization.description = value,
    };
    return fieldMap[type];
  }

  Widget _buildTextField(
      {required String type,
      required String label,
      required String placeholder}) {
    return SizedBox(
      width: 300,
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
      appBar: AppBar(
        title: Text('Charity Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: AvatarPicker(
                  onImagePicked: (File pickedImage) {
                    setState(() {
                      _organization.image = pickedImage;
                    });
                  },
                ),
              ),
              _buildTextField(
                type: 'name',
                label: 'Organization Name',
                placeholder: 'Enter the name of your organization',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'address',
                label: 'Address',
                placeholder: 'Enter your organization\'s address',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'country',
                label: 'Country',
                placeholder: 'Enter your organization\'s country',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'mission',
                label: 'Mission',
                placeholder: 'Enter your organization\'s mission statement',
              ),
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'description',
                label: 'Description',
                placeholder: 'Enter your organization\'s description',
              ),
              SizedBox(height: 26.0),
              ElevatedButton(
                onPressed: () {
                  print(_organization.toJson());
                  orgSignUp(_organization);
                },
                child: Text(
                  'Sign up',
                  textScaleFactor: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
