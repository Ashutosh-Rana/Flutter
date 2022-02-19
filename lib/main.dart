import 'package:first_app/pages/cart_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.light_Theme(context),
      
      darkTheme: MyTheme.dark_Theme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}


