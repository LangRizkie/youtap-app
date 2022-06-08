import 'package:application/components/bottomsheet/bottom_sheet.component.dart';
import 'package:application/components/empty/empty.component.dart';
import 'package:application/components/image/image_network.component.dart';
import 'package:application/components/loading/circular.component.dart';
import 'package:application/models/movie_detail.model.dart';
import 'package:application/models/review.model.dart';
import 'package:application/models/movies.model.dart';
import 'package:application/modules/endpoint.module.dart';
import 'package:application/modules/global.module.dart';
import 'package:application/modules/theme.module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SectionMovies extends StatefulWidget {
  const SectionMovies({Key? key, required this.menu}) : super(key: key);

  final Map<String, dynamic> menu;

  @override
  State<SectionMovies> createState() => _SectionMoviesState();
}

class _SectionMoviesState extends State<SectionMovies> {
  UniqueKey key = UniqueKey();
  MovieMenu? menu;

  @override
  void initState() {
    menu = MovieMenu.fromJson(widget.menu);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      initialData: null,
      create: (context) => _getMovies(menu!),
      child: Consumer<Movies>(
        builder: (context, Movies? movies, widget) => Container(
          child: movies != null
              ? _movieSection(menu!.name ?? '', movies)
              : const Center(
                  child: LoadingCircular(),
                ),
        ),
      ),
    );
  }

  Future<Movies> _getMovies(MovieMenu menu) async {
    Response response =
        await Endpoint.get(menu.url, queryParameters: menu.query);

    return Movies.fromJson(response.data);
  }

  Future _getMovieDetail(MovieMenu menu, int? id) async {
    MovieMenu detail = MovieMenu.fromJson(menu.detail!);
    Response response = await Endpoint.get(detail.url! + id.toString());

    return MovieDetail.fromJson(response.data);
  }

  _getMovieReview(MovieMenu menu, int? id) async {
    MovieMenu detail = MovieMenu.fromJson(menu.detail!);
    MovieMenu review = MovieMenu.fromJson(detail.review!);

    Response response =
        await Endpoint.get(detail.url! + id.toString() + review.url!);

    return Review.fromJson(response.data);
  }

  Column _movieSection(String title, Movies movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Palettes.nyctophile),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              movies.results!.length,
              (index) => _createPoster(index, movies.results!),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector _createPoster(int index, List result) {
    MovieResults poster = MovieResults.fromJson(result[index]);

    return GestureDetector(
      onTap: () => _openModalBottomSheet(poster),
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 0,
          right: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: _imageContainer(poster),
      ),
    );
  }

  Hero _imageContainer(MovieResults poster) {
    return Hero(
      tag: '$key#${poster.posterPath}',
      child: ImageNetwork(
        imageUrl: Global.getPoster(poster.posterPath),
      ),
    );
  }

  Future _openModalBottomSheet(MovieResults poster) async {
    MovieDetail detail = await _getMovieDetail(menu!, poster.id);
    Review review = await _getMovieReview(menu!, poster.id);

    CustomBottomSheet.openModalBottomSheet(context,
        child: DraggableScrollableSheet(
          expand: false,
          maxChildSize: 1,
          initialChildSize: 0.6,
          builder: (_, controller) => Column(
            children: [
              ImageNetwork(
                width: double.infinity,
                emptyHeight: 200,
                imageUrl: Global.getPoster(poster.backdropPath),
              ),
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 12,
                      ),
                      child: _detailTitle(detail.title!)
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _detailType(detail),
                            _detailRated(detail.adult!),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 24,
                      thickness: 1,
                    ),
                    if (detail.overview!.isNotEmpty)
                      _detailOverview(detail.overview!),
                    _detailReview(review)
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Text _detailTitle(String title) => Text(
        title,
        style: TextStyle(
          color: Palettes.nyctophile,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      );

  Container _detailRated(bool isAdult) => Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Palettes.mint,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          Global.isAdult(isAdult),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: Palettes.nyctophile,
          ),
        ),
      );

  Expanded _detailType(MovieDetail detail) => Expanded(
        child: Row(
          children: [
            Text(
              DateFormat('yyyy').format(
                DateTime.parse(detail.releaseDate!).toLocal(),
              ),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Palettes.nyctophile,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              detail.genres!.map((e) => e['name']).join(', '),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Palettes.nyctophile,
              ),
            ),
          ],
        ),
      );

  Column _detailOverview(String overview) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          overview,
            style: TextStyle(
              color: Palettes.nyctophile,
              fontWeight: FontWeight.w600,
            ),
          ),
      ),
      const Divider(
        height: 24,
        thickness: 1,
      ),
    ],
  );

  Padding _detailReview(Review review) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Movie Review',
              style: TextStyle(
                color: Palettes.nyctophile,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: review.results!.isNotEmpty
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        review.results!.length,
                        (index) => Container(
                          width: 300,
                          height: 150,
                          margin: EdgeInsets.only(
                            right: index != review.results!.length - 1 ? 16 : 0
                          ),
                          child: _detailReviewCard(
                            ReviewResults.fromJson(review.results![index]),
                          ),
                        ),
                      ),
                    )
                  : const EmptyComponent(),
                ),
        ],
      ),
    );
  }

  Container _detailReviewCard(ReviewResults results) {
    ReviewAuthorDetails author =
        ReviewAuthorDetails.fromJson(results.authorDetails!);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Palettes.black.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(8), 
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Palettes.mint,
                child: ClipOval(
                  child: ImageNetwork(
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageUrl: author.avatarPath,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  author.username!,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Palettes.nyctophile,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              results.content!,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Palettes.nyctophile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
