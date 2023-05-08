import 'url_Class.dart';

// APi client mein base url dalna rizwaz
final apiClient = ApiClient(
  baseUrl: 'http://localhost:3001',
  headers: {'Content-Type': 'application/json'},
);

login(value) {
  print("hleo");
  return apiClient.post('/', value);
}

orgSignUp(value) {
  print("hleo");
  return apiClient.post('/', value);
}

userSignup(value) {
  print("hleo");
  return apiClient.post('/', value);
}
