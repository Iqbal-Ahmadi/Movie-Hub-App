import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_icons.dart';
import 'package:mvvm_statemanagement/models/movie_model.dart';
import 'package:mvvm_statemanagement/screens/movie_detail.dart';
import 'package:mvvm_statemanagement/service/getit_service.dart';
import 'package:mvvm_statemanagement/service/navigator_service.dart';
import 'package:mvvm_statemanagement/widgets/cache_network_image.dart';
import 'package:mvvm_statemanagement/widgets/movies/favorite_btn.dart';
import 'package:mvvm_statemanagement/widgets/movies/genre_list_widget.dart';
import 'package:provider/provider.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final movieModelProvider = Provider.of<MovieModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12.0),
        surfaceTintColor: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            // Todo: navigate ot movie details screen
            getit<NavigationService>().navigate(ChangeNotifierProvider.value(value: movieModelProvider, child: MovieDetail()));
          },
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: movieModelProvider.id!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: CacheNetworkWidget(
                          url:
                              'https://image.tmdb.org/t/p/w500${movieModelProvider.backdropPath}'),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movieModelProvider.title!,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              size: 20.0,
                              MyAppIcons.star,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                                '${movieModelProvider.voteAverage!.toStringAsFixed(0)}/10')
                          ],
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        // Todo: Add the geners widget
                        GenreListWidget(genreId: movieModelProvider.genreIds),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              MyAppIcons.watchLater,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            const SizedBox(width: 5.0),
                            Text(
                              movieModelProvider.releaseDate!,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const Spacer(),
                            FavoriteButton(movieModel: movieModelProvider,)
                          ],
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
