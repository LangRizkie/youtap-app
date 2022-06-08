import 'package:flutter/foundation.dart';

class Television extends ChangeNotifier {
  int? page;
  List? results;
  int? totalPages;
  int? totalResults;

  Television({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Television.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = json['results'] ?? [];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results,
        'totalPages': totalPages,
        'totalResults': totalResults,
      };
}

class TelevisionMenu {
  String? name;
  String? url;
  Map<String, dynamic>? query;
  Map<String, dynamic>? detail;
  Map<String, dynamic>? review;

  TelevisionMenu({
    this.name,
    this.url,
    this.query,
    this.detail,
    this.review,
  });

  TelevisionMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    query = json['query'];
    detail = json['detail'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
        'query': query,
        'detail': detail,
        'review': review,
      };
}

class TelevisionResults {
  String? posterPath;
  String? overview;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  String? originalName;
  String? backdropPath;
  List<String>? originalCountry;
  String? originalLanguage;
  num? popularity;
  int? voteCount;
  num? voteAverage;

  TelevisionResults({
    this.posterPath,
    this.overview,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originalName,
    this.backdropPath,
    this.originalCountry,
    this.originalLanguage,
    this.popularity,
    this.voteCount,
    this.voteAverage,
  });

  TelevisionResults.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    overview = json['overview'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    backdropPath = json['backdrop_path'];
    originalCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() => {
        'posterPath': posterPath,
        'overview': overview,
        'firstAirDate': firstAirDate,
        'genreIds': genreIds,
        'id': id,
        'name': name,
        'originalName': originalName,
        'backdropPath': backdropPath,
        'originalCountry': originalCountry,
        'originalLanguage': originalLanguage,
        'popularity': popularity,
        'voteCount': voteCount,
        'voteAverage': voteAverage,
      };
}
