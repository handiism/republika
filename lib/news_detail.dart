import 'package:flutter/material.dart';
import 'package:republika/model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final Post post;

  const NewsDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                DateFormat('EEEE, d MMM yyyy').format(post.pubDate),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.network(post.thumbnail),
              const SizedBox(
                height: 15,
              ),
              Text(post.description),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    var uri = Uri.parse(post.link);
                    await launchUrl(uri);
                  },
                  child: const Text("Baca Selengkapnya..."),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
