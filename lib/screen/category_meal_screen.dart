import 'package:f2/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../Model/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  // final String categoryId;
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadInitDate = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitDate) {
      final routsArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routsArgs['title'];
      final categoryId = routsArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitDate = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              complexity: displayedMeals![index].complexity,
              affordability: displayedMeals![index].affordability,
              // removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals!.length,
        ));
  }
}
