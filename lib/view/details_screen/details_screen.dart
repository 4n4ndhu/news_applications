import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  String imageUrl;
  String title;
  String? author;
  String description;
  String content;
  String url;

  DetailsScreen(
      {super.key,
      required this.url,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.description,
      required this.content});

  // Function to launch a URL using Uri
  Future<void> launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // If the URL can't be launched, show an error in the console
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.share)],
        ),
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
                      width: 148,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () {
                            launchUrl(Uri.parse(url));
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
                Text(
                  description,
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
