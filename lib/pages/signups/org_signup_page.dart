import 'dart:io';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter_application_1/pages/signups/components/avatar_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/urls/urls.dart';
// {name: jkj, address: jkj, country: jk, mission: jjiji, description: ijikj, image: /data/user/0/com.example.flutter_application_1/cache/3ae10371-3670-49dc-8e83-e0a0d3eb8ff6/IMG_20230511_202018.jpg}
import '../../models/org.dart';
import '../../urls/UrlForPics/url_for_picture.dart';
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
  late final OrganizationInfo _organization = OrganizationInfo(image: File(""));
  late final Response response = Response("");

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
                padding: const EdgeInsets.all(32.0),
                child: AvatarPicker(
                  onImagePicked: (File pickedImage, String res) {
                    setState(() {
                      _organization.image = pickedImage;
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
              SizedBox(height: 16.0),
              _buildTextField(
                type: 'address',
                label: 'Address',
                placeholder: 'Enter your organization\'s address',
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
              SizedBox(height: 16.0),
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
              SizedBox(height: 26.0),
              ElevatedButton(
                onPressed: () {
                  print(_organization.image.path);
                  print(response.response);
                  // print(_organization.toJson());
                  // orgSignUp(_organization);
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
