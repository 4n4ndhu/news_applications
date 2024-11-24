import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_applications/controller/news_screen_controller.dart';
import 'package:news_applications/view/bottom_navbar_screen/bottom_navbar_screen.dart';

import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Consumer<NewsScreenController>(
          builder: (context, value, child) => SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Click on a Category ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              log(value.category[index]);
                              value.categoryIndex = value.category[index];
                              value.getData();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BottomNavbarScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Container(
                              color: Colors.red,
                              child: Center(
                                child: Text(value.category[index]),
                              ),
                            ),
                          ),
                        ),
                    itemCount: value.category.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    )),
              ],
            ),
          ),
        ));
  }
}
