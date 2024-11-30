import 'package:flutter/material.dart';
import 'package:news_applications/controller/news_screen_controller.dart';
import 'package:news_applications/view/category_screen/category_screen.dart';
import 'package:news_applications/view/details_screen/details_screen.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // You can trigger data fetching in initState if needed, like so:
    // context.read<NewsScreenController>().getData();
    _searchController.addListener(_filterNews);
  }

  void _filterNews() {
    final query = _searchController.text.toLowerCase();
    context.read<NewsScreenController>().filterNews(query);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterNews);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Consumer<NewsScreenController>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white),
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
                provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: provider.filteredDataList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      imageUrl: provider.filteredDataList[index]
                                              .urlToImage ??
                                          "",
                                      title: provider
                                          .filteredDataList[index].title
                                          .toString(),
                                      author: provider
                                          .filteredDataList[index].author
                                          .toString(),
                                      description: provider
                                          .filteredDataList[index].description
                                          .toString(),
                                      content: provider
                                          .filteredDataList[index].content
                                          .toString(),
                                      url: provider.filteredDataList[index].url
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              child: provider
                                          .filteredDataList[index].urlToImage ==
                                      null
                                  ? SizedBox()
                                  : Container(
                                      padding: EdgeInsets.all(8),
                                      height: 250,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: NetworkImage(provider
                                              .filteredDataList[index]
                                              .urlToImage
                                              .toString()),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider.filteredDataList[index]
                                                        .author ==
                                                    null
                                                ? "no author"
                                                : provider
                                                    .filteredDataList[index]
                                                    .author
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            provider
                                                .filteredDataList[index].title
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
          );
        },
      ),
    );
  }
}
