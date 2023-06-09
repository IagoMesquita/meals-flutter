import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';
import '../models/category.dart';


class CategoriesMealsScreen extends StatelessWidget {

  final List<Meal> meals; 

  const CategoriesMealsScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final List<Meal> mealsByCategoty = meals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
            itemCount: mealsByCategoty.length,
            itemBuilder: (ctx, index) {
              return MealItem(meal: mealsByCategoty[index]);
            }));
  }
}
