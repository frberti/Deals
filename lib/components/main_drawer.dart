import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(
      {required IconData icon,
      required String label,
      required Function() onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  void _navigation({required BuildContext context, required String route}) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            width: double.infinity,
            height: 100,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            icon: Icons.restaurant,
            label: 'Refeições',
            onTap: () => _navigation(context: context, route: AppRoutes.HOME),
          ),
          _createItem(
            icon: Icons.settings,
            label: 'Configurações',
            onTap: () => _navigation(context: context, route: AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
