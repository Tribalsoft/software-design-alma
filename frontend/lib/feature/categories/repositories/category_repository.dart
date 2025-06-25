import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryRepository {
  final String _baseUrl = 'https://mocki.io/v1/fd8115f4-f0c0-407d-ba6d-865da1364433';

  Future<List<CategoryModel>> getCategories() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}