import 'package:flutter/foundation.dart';

class Movies extends ChangeNotifier {
  int? page;
  List? results;
  int? totalPages;
  int? totalResults;
  Map? dates;

  Movies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
    this.dates,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = json['results'] ?? [];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    dates = json['dates'] ?? {};
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results,
        'totalPages': totalPages,
        'totalResults': totalResults,
        'dates': dates,
      };
}

class MovieMenu {
  String? name;
  String? url;
  Map<String, dynamic>? query;
  Map<String, dynamic>? detail;
  Map<String, dynamic>? review;

  MovieMenu({
    this.name,
    this.url,
    this.query,
    this.detail,
    this.review,
  });

  MovieMenu.fromJson(Map<String, dynamic> json) {
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

class MovieResults {
  String? posterPath;
  bool? adult;
  String? overview;
  String? releaseDate;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  String? title;
  String? backdropPath;
  num? popularity;
  int? voteCount;
  bool? video;
  num? voteAverage;

  MovieResults({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  MovieResults.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() => {
        'posterPath': posterPath,
        'adult': adult,
        'overview': overview,
        'releaseDate': releaseDate,
        'genreIds': genreIds,
        'id': id,
        'originalTitle': originalTitle,
        'originalLanguage': originalLanguage,
        'title': title,
        'backdropPath': backdropPath,
        'popularity': popularity,
        'voteCount': voteCount,
        'video': video,
        'voteAverage': voteAverage,
      };
}

class MovieDates {
  String? maximum;
  String? minimum;

  MovieDates({
    this.maximum,
    this.minimum,
  });

  MovieDates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() => {'maximum': maximum, 'minimum': minimum};
}
