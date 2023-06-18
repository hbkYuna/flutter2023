import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to my Recipe App',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Image.asset(
              'lib/assets/images/recipe_app_logo.png', 
              height: 200,
              width: 200,
            ),
            SizedBox(height: 16),
            Text(
              'In this app, you will be able to explore some randomized recipes each time you enter our Recipe screen and filter them to your liking.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
