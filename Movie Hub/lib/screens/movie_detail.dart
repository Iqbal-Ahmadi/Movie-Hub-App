import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/widgets/cache_network_image.dart';
import 'package:mvvm_statemanagement/widgets/movies/favorite_btn.dart';
import 'package:mvvm_statemanagement/widgets/movies/genre_list_widget.dart';
import 'package:provider/provider.dart';

import '../constants/my_app_icons.dart';
import '../models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final movieModelProvider = Provider.of<MovieModel>(context);
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Hero(
              tag: movieModelProvider.id!,
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.45,
                child: CacheNetworkWidget(
                  url: 'https://image.tmdb.org/t/p/w500${movieModelProvider.backdropPath}'
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.4,
                    // color: Colors.blue,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  movieModelProvider.title!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: 28.0),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      size: 20.0,
                                      MyAppIcons.star,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text('${movieModelProvider.voteAverage!.toStringAsFixed(0)}/10'),
                                    Spacer(),
                                    Text(
                                      movieModelProvider.releaseDate!,
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                GenreListWidget(genreId: movieModelProvider.genreIds),
                                SizedBox(height: 15.0),
                                Text(
                                  movieModelProvider.overview!,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor,
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: FavoriteButton(movieModel: movieModelProvider)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
