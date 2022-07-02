import 'dart:convert';
import 'package:flutter_movies_app/models/credistModel.dart';
import 'package:flutter_movies_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class AppService {
  static const _movieBaseUrl = "https://api.themoviedb.org/3/movie/";
  static const trendingMovieApiUrl =
      "https://api.themoviedb.org/3/trending/movie/week";
  static const popularMovieApiUrl = "popular";
  static const topRatedMovieApiUrl = "top_rated";
  static const upComingMovieApiUrl = "upcoming";
  static const _apiKey = "a975cae7aa8d38a8657cbf1021c1762c";
  static const _language = "tr-TR";
  static const _page = 1;

  static Future<List<MovieModelResults>?> getMovieLists(String apiUrl) async {
    var url = Uri.parse('$_movieBaseUrl$apiUrl?api_key=$_apiKey');

    Map<String, String> queryParams = {
      "language": _language,
      "page": "$_page",
    };

    List<MovieModelResults> list = [];

    try {
      var response = await http.get(url, headers: queryParams);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        list = body["results"]
            .map<MovieModelResults>((j) => MovieModelResults.fromJson(j))
            .toList();

        return list;
      } else {
        throw Exception("Invalid data received from the server!");
      }
    } catch (e) {
      throw Exception("Something went wrong! \n $e");
    }
  }

  static Future<List<MovieModelResults>?> getTrendingMovieList(
      String apiUrl) async {
    var url = Uri.parse('$apiUrl?api_key=$_apiKey');

    Map<String, String> queryParams = {
      "language": _language,
      "page": "$_page",
    };

    List<MovieModelResults> list = [];

    try {
      var response = await http.get(url, headers: queryParams);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        list = body["results"]
            .map<MovieModelResults>((j) => MovieModelResults.fromJson(j))
            .toList();
        return list;
      } else {
        throw Exception("Invalid data received from the server!");
      }
    } catch (e) {
      throw Exception("Something went wrong! \n $e");
    }
  }

  static Future<List<CredistModelCast>?> getCasts(int id) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=a975cae7aa8d38a8657cbf1021c1762c&language=tr-TR');

    List<CredistModelCast> list = [];

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        list = body["cast"]
            .map<CredistModelCast>((j) => CredistModelCast.fromJson(j))
            .toList();
        return list;
      } else {
        throw Exception("Invalid data received from the server!");
      }
    } catch (e) {
      throw Exception("Something went wrong! \n $e");
    }
  }
}
