import 'package:flutter/material.dart';
import 'package:food_app/home/home_view.dart';
import 'package:food_app/root/root_view.dart';
import 'package:food_app/router/app_rout_name.dart';
import 'package:food_app/router/app_rout_page.dart';
import 'package:food_app/router/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutPage.routes,
      initialRoute: AppRouterName.root,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: appcolor.primary,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
              backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView());
  }
  }



