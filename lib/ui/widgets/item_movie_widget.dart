import 'package:flutter/material.dart';
import 'package:movieapp/pages/detail_page.dart';
import '../../models/movie_model.dart';
import '../general/colors.dart';
import 'line_widget.dart';

class ItemMovieWidget extends StatelessWidget {
  MovieModel movieModel;

  ItemMovieWidget({
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      movieId: movieModel.id,
                    )));
      },
      child: Container(
        height: heigth * 0.65,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${movieModel.posterPath}")),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 5))
            ]),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 15.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: kBrandPrimaryColor.withOpacity(0.7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movieModel.originalTitle,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    LineWidget(width: 100.0),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      movieModel.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              movieModel.releaseDate
                                  .toString()
                                  .substring(0, 10),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              movieModel.voteCount.toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: kBrandPrimaryColor),
                child: Text(
                  movieModel.voteAverage.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
