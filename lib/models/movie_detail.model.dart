import 'package:flutter/foundation.dart';

class MovieDetail extends ChangeNotifier {
  bool? adult;
  String? backdropPath;
  Map<String, dynamic>? belongsToCollection;
  int? budget;
  List? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List? productionCompanies;
  List? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetail({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDetail.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    genres = json['genres'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = json['production_companies'];
    productionCountries = json['production_countries'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    spokenLanguages = json['spoken_languages'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'belongs_to_collection': belongsToCollection,
        'budget': budget,
        'genres': genres,
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'production_companies': productionCompanies,
        'production_countries': productionCountries,
        'release_date': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'spoken_languages': spokenLanguages,
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}

class MovieGenres {
  int? id;
  String? name;

  MovieGenres({
    this.id,
    this.name,
  });

  MovieGenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class MovieProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  MovieProductionCompanies({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  MovieProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };
}

class MovieProductionCountries {
  String? iso31661;
  String? name;

  MovieProductionCountries({this.iso31661, this.name});

  MovieProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'iso_3166_1': iso31661,
        'name': name,
      };
}

class MovieSpokenLanguages {
  String? iso6391;
  String? name;

  MovieSpokenLanguages({this.iso6391, this.name});

  MovieSpokenLanguages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'iso_639_1': iso6391,
        'name': name,
      };
}
