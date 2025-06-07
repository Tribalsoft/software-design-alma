import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart'; // Aquí está la clase Product

class CategoryRepository {
  // Reemplaza esto con TU URL de Mocky
  final String _baseUrl = 'https://run.mocky.io/v3/fb57fa33-e4eb-4893-b6fd-a947edede8e5';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}
