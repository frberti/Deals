import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'models/meal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    _availableMeals = dummyMeals.where((meal) {
      final glutenFilter = settings.isGlutenFreeChecked && !meal.isGlutenFree;
      final lactoseFilter = settings.isLactoseFreeChecked && !meal.isLactoseFree;
      final veganFilter = settings.isVeganChecked && !meal.isVegan;
      final vegetarianFilter = settings.isVegetarianChecked && !meal.isVegetarian;
      return !glutenFilter && !lactoseFilter && !veganFilter && !vegetarianFilter;
    }).toList();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
          background: Colors.white,
        ),
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
          ),
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      routes: {
        AppRoutes.HOME : (context) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS : (context) => CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL : (context) => const MealDetailScreen(),
        AppRoutes.SETTINGS : (context) => SettingsScreen(onSettingsChanged: _filterMeals),
      },
    );
  }
}
