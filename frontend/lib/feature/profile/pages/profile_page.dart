import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        backgroundColor: const Color.fromARGB(255, 225, 51, 51),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundColor: const Color.fromARGB(255, 225, 51, 51),
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Center(child: Text("Nombre del Usuario", style: TextStyle(fontSize: 18))),
          const Divider(height: 40, thickness: 1.5),

          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Mi cuenta'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: const Text('Mis pedidos'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configuración'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
