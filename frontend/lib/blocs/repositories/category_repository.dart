import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryRepository {
  final String _baseUrl = 'https://run.mocky.io/v3/e0389d11-5e31-42c7-bf5d-d1ba73e0dee0';

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
