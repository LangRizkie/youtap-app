import 'package:application/pages/movies/section/section.movies.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key, required this.movies}) : super(key: key);

  final Map<String, dynamic> movies;

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<String>? menu;

  @override
  void initState() {
    menu = widget.movies.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: List.generate(
          menu!.length, (index) => 
          Container(
            margin: EdgeInsets.only(
              bottom: index == menu!.length - 1 ? 16 : 0
            ),
            child: SectionMovies(menu: widget.movies[menu![index]]),
          ),
        ),
      ),
    );
  }
}
