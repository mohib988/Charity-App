import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter_application_1/pages/signups/components/avatar_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/urls/urls.dart';
// {name: jkj, address: jkj, country: jk, mission: jjiji, description: ijikj, image: /data/user/0/com.example.flutter_application_1/cache/3ae10371-3670-49dc-8e83-e0a0d3eb8ff6/IMG_20230511_202018.jpg}
import '../../models/org.dart';
import '../../urls/UrlForPics/url_for_picture.dart';
import '../../urls/urls.dart';
import 'actions/singup_action.dart';

class Response {
  String response;
  Response(this.response);
}

class OrganizationSignupPage extends StatefulWidget {
  @override
  OrganizationSignupPageState createState() => OrganizationSignupPageState();
}

class OrganizationSignupPageState extends State<OrganizationSignupPage> {
  late final OrganizationInfo _organization = OrganizationInfo(image: '');
  late final Response response = Response("");
  @override
  void initState() {
    getData();
  }

  Future<Map<String, dynamic>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final org_signup_cred = {
      'username': prefs.getString('Username'),
      'email': prefs.getString('Email'),
      'password1': prefs.getString('Password1'),
      'password2': prefs.getString('Password2'),
      'user_type': prefs.getString('Usertype')
    };
    print('USERNAME IS $org_signup_cred');
    return org_signup_cred;
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
        onChanged: getOnChangedFunction(_organization, type),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CloudinaryContext.cloudinary =
        Cloudinary.fromCloudName(cloudName: 'djecqwc0z');
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
                padding: const EdgeInsets.all(12.0),
                child: AvatarPicker(
                  onImagePicked: (File pickedImage, String res) {
                    setState(() {
                      // Convert string to object
                      Map<String, dynamic> jsonObject = json.decode(res);
                      var avatar_url = jsonObject['secure_url'];
                      print("Object: $avatar_url");

                      _organization.image = avatar_url;
                      response.response = res;
                    });
                  },
                ),
              ),
              //   CldImageWidget(
              //   publicId: "dog",
              // ),

              _buildTextField(
                type: 'name',
                label: 'Organization Name',
                placeholder: 'Enter the name of your organization',
              ),
              SizedBox(height: 6.0),
              _buildTextField(
                type: 'address',
                label: 'Address',
                placeholder: 'Enter your organization\'s address',
              ),

              SizedBox(height: 6.0),
              _buildTextField(
                type: 'mission',
                label: 'Mission',
                placeholder: 'Enter your organization\'s mission statement',
              ),
              SizedBox(height: 6.0),
              _buildTextField(
                type: 'description',
                label: 'Description',
                placeholder: 'Enter your organization\'s description',
              ),
              SizedBox(height: 6.0),
              ElevatedButton(
                  onPressed: () {
                    showCountryPicker(
                        context: context,
                        showPhoneCode:
                            false, // optional. Shows phone code before the country name.
                        onSelect: (Country country) {
                          setState(() {
                            print(country.displayNameNoCountryCode);
                            _organization.country = country.displayName;
                          });
                        });
                  },
                  child: Text("Select Country 🔻")),
              SizedBox(height: 6.0),
              ElevatedButton(
                onPressed: () async{
                  print(_organization.image);
                  print(response.response);
                  print(_organization.toJson());
                  await orgSignup(
                    getData,
                    (){
                                                Navigator.pushNamed(context, "/profile");

                    }
                    //Navigator.pushNamed(context, "/home");
                  , _organization);
                  //    getData();
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
