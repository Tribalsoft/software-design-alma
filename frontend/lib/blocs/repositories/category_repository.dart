import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/category.dart';


class CategoryRepository {
  final String apiUrl = 'https://run.mocky.io/v3/01b8f729-fa09-4046-813c-c8fc767bc51a'; // Reemplaza con tu Mocky URL

  Future<List<Category>> getCategories() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener categorías');
    }
  }
}
