import 'package:flutter/material.dart';

import '../feature/categories/pages/homescreen.dart';
import '../feature/categories/repositories/category_repository.dart';
import '../feature/home/pages/homepage.dart';
import '../feature/profile/pages/profile_page.dart';

class MainScaffold extends StatefulWidget {
  final CategoryRepository categoryRepository = CategoryRepository();
  
  MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(categoryRepository: CategoryRepository(),),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.black12, width: 1),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              elevation: 0,
              items: const [
                //* Icono de home
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Comprar',
                ),
                //* Icono de categorías
                BottomNavigationBarItem(
                  icon: Icon(Icons.manage_search_outlined),
                  activeIcon: Icon(Icons.manage_search),
                  label: 'Categorías',
                ),
                //* Icono de tendencias
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(), // espacio vacío para el centro
                  label: '',
                ),
                //* Icono de carrito
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  activeIcon: Icon(Icons.shopping_cart),
                  label: 'Carrito',
                ),
                //* Icono de perfil
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Yo',
                ),
              ],
            ),
          ),

          // Ícono fuego sobresaliendo
          Positioned(
            bottom: 5,
            child: GestureDetector(
              onTap: () => _onItemTapped(2),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.asset('../../assets/icon_trending.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
