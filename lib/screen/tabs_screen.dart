import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/fvorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedSreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
    {'title': 'Meus Favotiros', 'screen': const FavoriteScreen()},
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedSreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(_screens[_selectedSreenIndex]['title'] as String)),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedSreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          currentIndex: _selectedSreenIndex,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categotias'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          ]),
    );
  }
}
