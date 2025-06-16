import 'package:flutter/material.dart';

class PerfilErrorView extends StatelessWidget {
  final String mensaje;
  final VoidCallback onRetry;

  const PerfilErrorView({
    super.key,
    required this.mensaje,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mensaje,
            style: const TextStyle(color: Colors.blue, fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text("Reintentar"),
          ),
        ],
      ),
    );
  }
}
