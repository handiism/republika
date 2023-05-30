import 'package:flutter/material.dart';
import 'package:republika/news_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "https://static.republika.co.id/files/images/logo.png",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(context, "Terbaru"),
                  const SizedBox(
                    width: 10,
                  ),
                  button(context, "Daerah"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(context, "Internasional"),
                  const SizedBox(
                    width: 10,
                  ),
                  button(context, "Islam"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox button(BuildContext context, String category) {
    return SizedBox(
      width: 140,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsList(
                category: category,
              ),
            ),
          );
        },
        child: Text(
          category.toUpperCase(),
        ),
      ),
    );
  }
}
