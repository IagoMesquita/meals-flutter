import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
          bottom: const TabBar(tabs: [
           Tab(icon: Icon(Icons.category), child: Text('Categprias'),),
           Tab(icon: Icon(Icons.star), child: Text('Favoritos'),),
          ]),
        ),
      ),
    );
  }
}
