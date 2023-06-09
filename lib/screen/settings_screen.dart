import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/utils/app_routes.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;

  final Function(Settings) onSettingsChange;

  const SettingsScreen({super.key, required this.settings, required this.onSettingsChange, });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(widget.settings);
      } ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configurações'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
              icon: const Icon(Icons.close))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glutén',
                  widget.settings.isGlutenFree,
                  (value) {
                    setState(() => widget.settings.isGlutenFree = value);
                  },
                ),
                _createSwitch(
                  'Sem lactose',
                  'Só exibe refeições sem lactose',
                  widget.settings.isLactoseFree,
                  (value) {
                    setState(() => widget.settings.isLactoseFree = value);
                  },
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições veganas',
                  widget.settings.isVegan,
                  (value) {
                    setState(() => widget.settings.isVegan = value);
                  },
                ),
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições vegetarianas',
                  widget.settings.isVegetarian,
                  (value) {
                     setState(() => widget.settings.isVegetarian = value);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
