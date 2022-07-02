// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_movies_app/constants/app_constants.dart';
import 'package:flutter_movies_app/models/credistModel.dart';

import 'package:flutter_movies_app/models/movie_model.dart';
import 'package:flutter_movies_app/services/app_service.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModelResults model;
  const MovieDetailPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  List<CredistModelCast>? list;

  @override
  void initState() {
    super.initState();
    getCats();
  }

  void getCats() async {
    list = await AppService.getCasts(widget.model.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            widget.model.title.toString(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.star_border),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_border,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .56,
                child: Stack(
                  children: [
                    SizedBox(
                      width: size.width,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w1280/${widget.model.backdropPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            Image.network(
                                "https://image.tmdb.org/t/p/w154/${widget.model.posterPath}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: size.height * .3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      widget.model.title.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppConstants.primaryColor,
                                          size: 18,
                                        ),
                                        Text(
                                          widget.model.voteAverage.toString(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * .2,
                                      child: Text(
                                        widget.model.overview.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              list?.length != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: size.width,
                        height: size.height * .3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Oyuncular',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: list!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: SizedBox(
                                        width: size.width * .3,
                                        height: size.width * .3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            list![index].profilePath != null
                                                ? Image.network(
                                                    "https://image.tmdb.org/t/p/w185${list![index].profilePath}",
                                                  )
                                                : const Placeholder(
                                                    fallbackWidth: 100,
                                                    fallbackHeight: 150,
                                                  ),
                                            Text(list![index].originalName ??
                                                ''),
                                          ],
                                        ),
                                      ));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ));
  }
}
