import 'package:flutter/material.dart';
import 'package:news_applications/controller/detail_screen_controller.dart';
import 'package:news_applications/main.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  String imageUrl;
  String title;
  String? author;
  String descrbtion;
  String content;
  String url;

  DetailsScreen(
      {super.key,
      required this.url,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.descrbtion,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageUrl), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 221,
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        author == null ? "no author" : "By $author",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue)),
                          onPressed: () {
                            context
                                .read<DetailScreenController>()
                                .launchURL(url);
                          },
                          child: Center(
                            child: Text(
                              "Visit",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  descrbtion,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}
