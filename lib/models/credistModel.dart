// ignore_for_file: file_names

class CredistModelCrew {
/*
{
  "adult": false,
  "gender": 2,
  "id": 153,
  "known_for_department": "Sound",
  "name": "Thomas Newman",
  "original_name": "Thomas Newman",
  "popularity": 1.933,
  "profile_path": "/j8rIiOSdBjtDL5vji8m5BtChZou.jpg",
  "credit_id": "52fe4231c3a36847f800b153",
  "department": "Sound",
  "job": "Original Music Composer"
} 
*/

  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  CredistModelCrew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });
  CredistModelCrew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender']?.toInt();
    id = json['id']?.toInt();
    knownForDepartment = json['known_for_department']?.toString();
    name = json['name']?.toString();
    originalName = json['original_name']?.toString();
    popularity = json['popularity']?.toDouble();
    profilePath = json['profile_path']?.toString();
    creditId = json['credit_id']?.toString();
    department = json['department']?.toString();
    job = json['job']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['credit_id'] = creditId;
    data['department'] = department;
    data['job'] = job;
    return data;
  }
}

class CredistModelCast {
/*
{
  "adult": false,
  "gender": 2,
  "id": 504,
  "known_for_department": "Acting",
  "name": "Tim Robbins",
  "original_name": "Tim Robbins",
  "popularity": 15.156,
  "profile_path": "/hsCu1JUzQQ4pl7uFxAVFLOs9yHh.jpg",
  "cast_id": 3,
  "character": "Andy Dufresne",
  "credit_id": "52fe4231c3a36847f800b131",
  "order": 0
} 
*/

  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  CredistModelCast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });
  CredistModelCast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender']?.toInt();
    id = json['id']?.toInt();
    knownForDepartment = json['known_for_department']?.toString();
    name = json['name']?.toString();
    originalName = json['original_name']?.toString();
    popularity = json['popularity']?.toDouble();
    profilePath = json['profile_path']?.toString();
    castId = json['cast_id']?.toInt();
    character = json['character']?.toString();
    creditId = json['credit_id']?.toString();
    order = json['order']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}

class CredistModel {
/*
{
  "id": 278,
  "cast": [
    {
      "adult": false,
      "gender": 2,
      "id": 504,
      "known_for_department": "Acting",
      "name": "Tim Robbins",
      "original_name": "Tim Robbins",
      "popularity": 15.156,
      "profile_path": "/hsCu1JUzQQ4pl7uFxAVFLOs9yHh.jpg",
      "cast_id": 3,
      "character": "Andy Dufresne",
      "credit_id": "52fe4231c3a36847f800b131",
      "order": 0
    }
  ],
  "crew": [
    {
      "adult": false,
      "gender": 2,
      "id": 153,
      "known_for_department": "Sound",
      "name": "Thomas Newman",
      "original_name": "Thomas Newman",
      "popularity": 1.933,
      "profile_path": "/j8rIiOSdBjtDL5vji8m5BtChZou.jpg",
      "credit_id": "52fe4231c3a36847f800b153",
      "department": "Sound",
      "job": "Original Music Composer"
    }
  ]
} 
*/

  int? id;
  List<CredistModelCast?>? cast;
  List<CredistModelCrew?>? crew;

  CredistModel({
    this.id,
    this.cast,
    this.crew,
  });
  CredistModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
  if (json['cast'] != null) {
  final v = json['cast'];
  final arr0 = <CredistModelCast>[];
  v.forEach((v) {
  arr0.add(CredistModelCast.fromJson(v));
  });
    cast = arr0;
    }
  if (json['crew'] != null) {
  final v = json['crew'];
  final arr0 = <CredistModelCrew>[];
  v.forEach((v) {
  arr0.add(CredistModelCrew.fromJson(v));
  });
    crew = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (cast != null) {
      final v = cast;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['cast'] = arr0;
    }
    if (crew != null) {
      final v = crew;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['crew'] = arr0;
    }
    return data;
  }
}
