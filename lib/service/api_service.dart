
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'http://192.168.68.239:8000/api/';

  dataUrl(data, url) async {
    var fullUrl = baseUrl + url;
    var response = await http.post(
      Uri.parse(fullUrl),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print(response.body);
    print(response.statusCode);
    return response;
  }
}