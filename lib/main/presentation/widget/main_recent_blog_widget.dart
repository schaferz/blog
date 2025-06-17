import 'package:blog/core/core.dart';
import 'package:blog/main/presentation/widget/main_recent_card_widget.dart';
import 'package:flutter/material.dart';

/// Az utoljára felvett blog bejegyzéseket megjelenítő lista.
class MainRecentBlogWidget extends StatelessWidget {
  const MainRecentBlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = RecentBlogData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Blog bejegyzések", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 12),
        for (var index = 0; index < data.blogData.length; index++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MainRecentCardWidget(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.blogData[index].title,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            data.blogData[index].description,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.more),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
