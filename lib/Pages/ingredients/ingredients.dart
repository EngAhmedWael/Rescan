import 'package:flutter/material.dart';
import 'package:recsan/Pages/ingredients/widget/ingredientsViewbody.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.ingredients});
  final String ingredients;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ingredientsView(
        ingredients: ingredients,
      ),
    );
  }
}
