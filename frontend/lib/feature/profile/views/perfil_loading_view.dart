import 'package:flutter/material.dart';

class PerfilLoadingView extends StatelessWidget {
  const PerfilLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
