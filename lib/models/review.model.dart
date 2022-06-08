import 'package:flutter/foundation.dart';

class Review extends ChangeNotifier {
  int? id;
  int? page;
  List? results;
  int? totalPages;
  int? totalResults;

  Review({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    page = json['page'];
    results = json['results'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'page': page,
        'results': results,
        'totalPages': totalPages,
        'totalResults': totalResults,
      };
}

class ReviewResults {
  String? author;
  Map<String, dynamic>? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  ReviewResults({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  ReviewResults.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    authorDetails = json['author_details'];
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() => {
        'author': author,
        'author_details': authorDetails,
        'content': content,
        'created_at': createdAt,
        'id': id,
        'updated_at': updatedAt,
        'url': url,
      };
}

class ReviewAuthorDetails {
  String? name;
  String? username;
  String? avatarPath;
  num? rating;

  ReviewAuthorDetails({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  ReviewAuthorDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'avatar_path': avatarPath,
        'rating': rating,
      };
}
