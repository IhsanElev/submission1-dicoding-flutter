import 'package:flutter/material.dart';

import 'package:restaurant_app/screen/detail_page_restaurant.dart';
import 'package:restaurant_app/screen/list_restaurant.dart';
import 'package:restaurant_app/screen/splash_screen.dart';
import 'package:restaurant_app/util/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: myTextTheme
      ),
      
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName:((context) => const SplashScreen())  ,
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        DetailPage.routeName :(context) => DetailPage(resto:
                    ModalRoute.of(context)?.settings.arguments as dynamic,)
      },
      
    );
  }
}
