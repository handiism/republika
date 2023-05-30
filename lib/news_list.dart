import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:republika/model.dart';
import 'package:republika/news_detail.dart';

class NewsList extends StatefulWidget {
  final String category;

  const NewsList({super.key, required this.category});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Post> posts = [];

  Future getData() async {
    var response = await http.get(
      Uri.parse(
        "https://api-berita-indonesia.vercel.app/republika/${widget.category.toLowerCase()}",
      ),
    );

    NewsListResponse newsListResponse = newsListResponseFromJson(response.body);
    posts.clear();
    posts = newsListResponse.data.posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPUBLIKA ${widget.category.toUpperCase()}"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetail(
                          post: posts[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 3 - 4,
                          child: Text(
                            posts[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1 / 3 - 4,
                          child: Image.network(posts[index].thumbnail),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
