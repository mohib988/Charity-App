import 'dart:convert';

import '../../models/org.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';

Future<http.Response> orgSignUp(OrganizationInfo formData, OrganizationInfo organization) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:8000/orgsignup/'),
  );
  print("We are in url for picture file");
  var signupSession = SessionManager();
  signupSession.get('Org_signup_info');
  //print(json.decode(info.toString()));
  print("session is ${signupSession.get('Org_signup_info')}");
print("PRINTING KEYS");
print(signupSession.containsKey("username"));
print(signupSession.containsKey("email"));
print(signupSession.containsKey("password1"));
print(signupSession.containsKey("password2"));

  request.fields['name'] = formData.name;
  request.fields['address'] = formData.address;
  request.fields['country'] = formData.country;
  request.fields['mission'] = formData.mission;
  request.fields['description'] = formData.description;
  print(formData.image);
  request.fields['image'] = formData.image;
  // var imageFile =
  //     await http.MultipartFile.fromPath('image', formData.image.path);
  // request.files.add(imageFile);
  // request.fields['image'] = formData.image;

  var response = await request.send();
print('response is $response');
  return http.Response.fromStream(response);
}
