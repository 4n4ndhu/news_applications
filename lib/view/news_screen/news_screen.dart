import 'package:flutter/material.dart';
import 'package:news_applications/controller/news_screen_controller.dart';
import 'package:news_applications/view/category_screen/category_screen.dart';
import 'package:news_applications/view/details_screen/details_screen.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  // String newsData = "";
  NewsScreen({
    super.key,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (timeStamp) {
  //       context.read<NewsScreenController>().getData();
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryScreen(),
                      ));
                },
                icon: Icon(Icons.arrow_right))
          ],
        ),
        body: Consumer<NewsScreenController>(
          builder: (context, provideObj, child) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Latest news",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                provideObj.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: provideObj.dataList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        imageUrl: provideObj
                                                .dataList[index].urlToImage ??
                                            "",
                                        title: provideObj.dataList[index].title
                                            .toString(),
                                        author: provideObj
                                            .dataList[index].author
                                            .toString(),
                                        descrbtion: provideObj
                                            .dataList[index].description
                                            .toString(),
                                        content: provideObj
                                            .dataList[index].content
                                            .toString(),
                                        url: provideObj.dataList[index].url
                                            .toString(),
                                      ),
                                    ));
                              },
                              child: provideObj.dataList[index].urlToImage ==
                                      null
                                  ? SizedBox()
                                  : Container(
                                      padding: EdgeInsets.all(8),
                                      height: 250,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(provideObj
                                                  .dataList[index].urlToImage
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provideObj.dataList[index].author ==
                                                    null
                                                ? "no author"
                                                : provideObj
                                                    .dataList[index].author
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            provideObj.dataList[index].title
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
