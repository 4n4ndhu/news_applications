import 'package:flutter/material.dart';
// import 'package:news_applications/controller/detail_screen_controller.dart';
import 'package:news_applications/controller/news_screen_controller.dart';

import 'package:news_applications/view/category_screen/category_screen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsScreenController(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => DetailScreenController(),
        // )
      ],
      child: MaterialApp(
        home: CategoryScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
