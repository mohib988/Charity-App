import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final Map<String, String> headers;

  ApiClient({required this.baseUrl, required this.headers});

  Future<http.Response> post(String path, body) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: headers,
    );

    return response;
  }

  Future<http.Response> get(String path) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.get(uri, headers: headers);
    return response;
  }

  // Add additional HTTP methods as needed
}


class ApiAuthClient {
  final String baseUrl;
  final Map<String, String> headers;

  ApiAuthClient({required this.baseUrl, required this.headers});

  Future<http.Response> post(String path, body, headers) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: headers,
    );

    return response;
  }

  Future<http.Response> get(String path, headers) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.get(uri, headers: headers);
    return response;
  }

  // Add additional HTTP methods as needed
}
