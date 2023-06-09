import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/favorite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal>favoriteMeals;

  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedSreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();

    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Meus Favotiros',
        'screen': FavoriteScreen(
         favoriteMeals: widget.favoriteMeals,
        ),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedSreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(_screens[_selectedSreenIndex]['title'] as String)),
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
