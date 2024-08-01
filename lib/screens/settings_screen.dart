import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      inactiveTrackColor: Colors.grey,
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(child: ListView(
            children: [
              _createSwitch(
                title: 'Sem Glúten',
                subtitle: 'Só exibe refeições sem glútem',
                value: settings.isGlutenFree,
                onChanged: (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createSwitch(
                title: 'Sem Lactose',
                subtitle: 'Só exibe refeições sem lactose',
                value: settings.isLactoseFree,
                onChanged: (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createSwitch(
                title: 'Vegana',
                subtitle: 'Só exibe refeições veganas',
                value: settings.isVegan,
                onChanged: (value) => setState(() => settings.isVegan = value),
              ),
              _createSwitch(
                title: 'Vegetariana',
                subtitle: 'Só exibe refeições vegetarianas',
                value: settings.isVegetarian,
                onChanged: (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
