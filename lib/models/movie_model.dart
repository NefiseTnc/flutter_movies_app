/*
{
  "adult": false,
  "backdrop_path": "/wcKFYIiVDvRURrzglV9kGu7fpfY.jpg",
  "genre_ids": [
    14
  ],
  "id": 453395,
  "original_language": "en",
  "original_title": "Doctor Strange in the Multiverse of Madness",
  "overview": "Film, Doctor Strange, Avengers Endgame ve Spider-Man: No Way Home'un devamı ve WandaVision ve Loki'nin bir geçiş filmi niteliğindedir. Marvel Sinematik Evreni'ndeki 28. ve Dördüncü Aşama'nın beşinci filmidir. Avengers: Endgame'deki olaylardan sonra Dr. Stephen Strange, Zaman Taşı üzerindeki araştırmasına devam ediyor. Ancak düşmana dönüşen eski bir dost, Strange'in planını bozarak ve aynı zamanda onun ağza alınamayacak bir kötülüğü serbest bırakmasına neden olarak, dünyadaki her büyücüyü yok etmeye çalışır.",
  "popularity": 11126.834,
  "poster_path": "/tQCKPTbfawjCRPSzBVlm6VUsaiw.jpg",
  "release_date": "2022-05-04",
  "title": "Doktor Strange Çoklu Evren Çılgınlığında",
  "video": false,
  "vote_average": 7.5,
  "vote_count": 3659
} 
*/

class MovieModelResults {
  bool? adult;
  String? backdropPath;
  List<int?>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModelResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  MovieModelResults.fromJson(Map<dynamic, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path']?.toString();
    if (json['genre_ids'] != null) {
      final v = json['genre_ids'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      genreIds = arr0;
    }
    id = json['id']?.toInt();
    originalLanguage = json['original_language']?.toString();
    originalTitle = json['original_title']?.toString();
    overview = json['overview']?.toString();
    popularity = json['popularity']?.toDouble();
    posterPath = json['poster_path']?.toString();
    releaseDate = json['release_date']?.toString();
    title = json['title']?.toString();
    video = json['video'];
    voteAverage = json['vote_average']?.toDouble();
    voteCount = json['vote_count']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['genre_ids'] = arr0;
    }
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class MovieModel {
/*
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/wcKFYIiVDvRURrzglV9kGu7fpfY.jpg",
      "genre_ids": [
        14
      ],
      "id": 453395,
      "original_language": "en",
      "original_title": "Doctor Strange in the Multiverse of Madness",
      "overview": "Film, Doctor Strange, Avengers Endgame ve Spider-Man: No Way Home'un devamı ve WandaVision ve Loki'nin bir geçiş filmi niteliğindedir. Marvel Sinematik Evreni'ndeki 28. ve Dördüncü Aşama'nın beşinci filmidir. Avengers: Endgame'deki olaylardan sonra Dr. Stephen Strange, Zaman Taşı üzerindeki araştırmasına devam ediyor. Ancak düşmana dönüşen eski bir dost, Strange'in planını bozarak ve aynı zamanda onun ağza alınamayacak bir kötülüğü serbest bırakmasına neden olarak, dünyadaki her büyücüyü yok etmeye çalışır.",
      "popularity": 11126.834,
      "poster_path": "/tQCKPTbfawjCRPSzBVlm6VUsaiw.jpg",
      "release_date": "2022-05-04",
      "title": "Doktor Strange Çoklu Evren Çılgınlığında",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 3659
    }
  ],
  "total_pages": 34127,
  "total_results": 682523
} 
*/

  int? page;
  List<MovieModelResults>? results;
  int? totalPages;
  int? totalResults;

  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page']?.toInt();
    if (json['results'] != null) {
      final v = json['results'];
      final arr0 = <MovieModelResults>[];
      v.forEach((v) {
        arr0.add(MovieModelResults.fromJson(v));
      });
      results = arr0;
    }
    totalPages = json['total_pages']?.toInt();
    totalResults = json['total_results']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v.toJson());
      }
      data['results'] = arr0;
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
