import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.get(
      Uri.parse("https://mocki.io/v1/51dfd773-1fd6-4452-9e6b-dc61869f2fb9")
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['data'] != null) {
        return {
          'name': data['data']['name'],
          'email': data['data']['email'],
          'profile_image': data['data']['profile_image'],
        };
      }
    }

    return null; // fallo
  }
}
