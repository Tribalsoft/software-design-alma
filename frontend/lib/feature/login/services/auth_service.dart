import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.get(
      Uri.parse("")
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
