import 'url_Class.dart';

final apiClient = ApiClient(
  baseUrl: 'http://localhost:3001',
  headers: {'Content-Type': 'application/json'},
);

login(value) {
  print("hleo");
  return apiClient.post('/user/signin', value);
}
