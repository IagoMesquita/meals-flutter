import 'package:flutter/material.dart';
import '../screen/categories_screen.dart';
import '../screen/categories_meals_screen.dart';
import '../screen/meal_detail_screen.dart';
import '../utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      } ,
    );
  }
}
