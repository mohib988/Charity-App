import '../../pages/org_signup_page.dart';
import 'package:http/http.dart' as http;

Future<http.Response> orgSignUp(OrganizationInfo formData) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://localhost:3001/user/signin'),
  );

  request.fields['name'] = formData.name;
  request.fields['address'] = formData.address;
  request.fields['country'] = formData.country;
  request.fields['mission'] = formData.mission;
  request.fields['description'] = formData.description;
  var imageFile =
      await http.MultipartFile.fromPath('image', formData.image.path);
  request.files.add(imageFile);
  // request.fields['image'] = formData.image;

  var response = await request.send();

  return http.Response.fromStream(response);
}
