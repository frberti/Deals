import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';

import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    super.key,
    required this.onSettingsChanged,
  });

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
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
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
                  title: 'Sem Glúten',
                  subtitle: 'Só exibe refeições sem glútem',
                  value: settings.isGlutenFreeChecked,
                  onChanged: (value) =>
                      setState(() => settings.isGlutenFreeChecked = value),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe refeições sem lactose',
                  value: settings.isLactoseFreeChecked,
                  onChanged: (value) =>
                      setState(() => settings.isLactoseFreeChecked = value),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições veganas',
                  value: settings.isVeganChecked,
                  onChanged: (value) =>
                      setState(() => settings.isVeganChecked = value),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe refeições vegetarianas',
                  value: settings.isVegetarianChecked,
                  onChanged: (value) =>
                      setState(() => settings.isVegetarianChecked = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
