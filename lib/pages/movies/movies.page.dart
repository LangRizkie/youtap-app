import 'package:application/components/loading/circular.component.dart';
import 'package:application/modules/global.module.dart';
import 'package:application/pages/movies/movies.screen.dart';
import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future? asyncData;
  Map<String, dynamic>? menu;

  @override
  void initState() {
    asyncData = Future.wait([getMoviesMenu()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: asyncData,
      builder: (BuildContext context, AsyncSnapshot snapshot) =>
        snapshot.connectionState != ConnectionState.done ?
          const Center(
            child: LoadingCircular(),
          ) : 
          MoviesScreen(movies: menu!)
      );
  }

  Future getMoviesMenu() async {
    await Global.getJSON('assets/json/movies.endpoint.json')
        .then((response) => menu = response);
  }
}
