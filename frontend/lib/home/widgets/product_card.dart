import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        leading: const Icon(Icons.shopping_bag),
        onTap: () {
          // Aquí podrías agregar la lógica para ver detalle o añadir al carrito
        },
      ),
    );
  }
}
