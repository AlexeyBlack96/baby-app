import 'package:flutter/material.dart';
import 'package:insta_clone/src/screens/home.dart';






class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      // onGenerateRoute: appRoutes.routes,
      home: MySplashScreen(), // insta_home.dart from screens package
    );
  }
}
