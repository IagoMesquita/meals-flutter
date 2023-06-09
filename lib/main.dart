import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import '../data/dummy_data.dart';
import '../screen/settings_screen.dart';
import '../screen/tabs_screen.dart';
import '../screen/categories_screen.dart';
import '../screen/categories_meals_screen.dart';
import '../screen/meal_detail_screen.dart';
import '../utils/app_routes.dart';

import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {

      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
         final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
         final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
         final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
         final filterVegan = settings.isVegan && !meal.isVegan;

         return !filterGluten && !filterLactose && !filterVegetarian && !filterVegan;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings: settings, onSettingsChange: _filterMeals)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}
