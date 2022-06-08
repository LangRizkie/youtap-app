import 'package:application/pages/app/app.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRoutes {
  static const id = ':id';
  static const routeApp = '/';
  static const routeMovieDetail = '/movie/';
  static const routeTVDetail = '/tv/';
}

class DetailArgument {
  num? id;
  String? posterPath;
  String? backdropPath;
  UniqueKey? key;

  DetailArgument(this.id, this.posterPath, this.backdropPath, this.key);

  DetailArgument.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['posterPath'];
    backdropPath = json['backdropPath'];
    key = json['key'];
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.routeApp,
          child: (context, args) => const App(),
        ),
      ];
}
