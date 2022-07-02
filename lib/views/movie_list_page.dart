import 'package:flutter/material.dart';

import 'package:flutter_movies_app/models/movie_model.dart';

class MovieListPage extends StatelessWidget {
  final List<MovieModelResults> list;
  final String title;
  const MovieListPage({
    Key? key,
    required this.list,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: ListTile(
              leading: Image.network(
                  "https://image.tmdb.org/t/p/w154/${list[index].posterPath}"),
              title: Text(
                list[index].title.toString(),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_right),
              ),
            ),
          );
        },
      ),
    );
  }
}
