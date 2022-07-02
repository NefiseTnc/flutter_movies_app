// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/constants/app_constants.dart';
import 'package:flutter_movies_app/models/movie_model.dart';
import 'package:flutter_movies_app/services/app_service.dart';
import 'package:flutter_movies_app/views/movie_detail_page.dart';
import 'package:flutter_movies_app/views/movie_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieModelResults>? popularList = [];
  List<MovieModelResults>? topRatedList = [];
  List<MovieModelResults>? upComingList = [];
  List<MovieModelResults>? trendingList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    popularList = await AppService.getMovieLists(AppService.popularMovieApiUrl);
    topRatedList =
        await AppService.getMovieLists(AppService.topRatedMovieApiUrl);
    upComingList =
        await AppService.getMovieLists(AppService.upComingMovieApiUrl);
    trendingList =
        await AppService.getTrendingMovieList(AppService.trendingMovieApiUrl);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Filmler',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildList(size, title: 'Popüler', list: popularList ?? []),
              _buildSizeLarge(),
              //_buildList(size, title: 'Trend Olanlar', list: popularList ?? []),
              //_buildSizeLarge(),
              _buildList(size,
                  title: 'En Çok Oy Alanlar', list: topRatedList ?? []),
              _buildSizeLarge(),
              _buildList(size,
                  title: 'Trend Olanlar', list: trendingList ?? []),
              _buildSizeLarge(),
              _buildList(size, title: 'Yakında', list: upComingList ?? []),
              _buildSizeLarge(),
            ],
          ),
        ));
  }

  SizedBox _buildSizeLarge() {
    return const SizedBox(
      height: 50,
    );
  }

  Widget _buildList(Size size,
      {required String title, required List<MovieModelResults> list}) {
    return SizedBox(
      width: size.width,
      height: size.height * .3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieListPage(list: list, title: title)));
                  },
                  child: const Text(
                    'Hepsini gör',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (list.length != null)
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailPage(model: list[index]),
                            ));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Image.network(
                                  "https://image.tmdb.org/t/p/w154/${list[index].posterPath}"),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .35,
                            child: Text(list[index].title.toString(),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '4.0',
          style: TextStyle(color: Colors.white, fontSize: 33),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: AppConstants.primaryColor,
            ),
            Icon(
              Icons.star,
              color: AppConstants.primaryColor,
            ),
            Icon(
              Icons.star,
              color: AppConstants.primaryColor,
            ),
            Icon(
              Icons.star,
              color: AppConstants.primaryColor,
            ),
            Icon(
              Icons.star_border,
              color: AppConstants.primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
