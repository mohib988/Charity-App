import 'url_Class.dart';

// APi client mein base url dalna rizwaz
final apiClient = ApiClient(
  baseUrl: 'http://localhost:8000',
  headers: {'Content-Type': 'application/json'},
);

login(value) {
  print("login");
  return apiClient.post('/dj-rest-auth/login/', value);
}

userSignup(value) {
  print("signup");
  return apiClient.post('/dj-rest-auth/registration/', value);
}
