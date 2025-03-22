import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_icons.dart';
import 'package:mvvm_statemanagement/constants/my_app_theme.dart';
import 'package:mvvm_statemanagement/screens/favorite_movie.dart';
import 'package:mvvm_statemanagement/view_model/movie_provider.dart';
import 'package:mvvm_statemanagement/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';
import '../service/getit_service.dart';
import '../service/navigator_service.dart';
import '../view_model/theme_provider.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        actions: [
          IconButton(
              onPressed: () {
                getit<NavigationService>().navigate(FavoriteMovie());
                // getit<NavigationService>().snackBarWiget();
              },
              icon: const Icon(
                MyAppIcons.favorite,
                color: Colors.red,
              )),
          Consumer<ThemeProvider>(builder: (context, Theme, child) {
            return IconButton(
                onPressed: () async {
                  Theme.toggleTheme();
                },
                icon: Icon(
                  Theme.themeData == MyThemeData.darkTheme
                      ? MyAppIcons.darkMode
                      : MyAppIcons.lightMode,
                  color: Colors.black,
                ));
          })
        ],
      ),
      body: Consumer<MovieProvider>(builder: (context, movieProvider, child) {
        if (movieProvider.getisFetching && movieProvider.getMovies.isEmpty) {
          return Center(child: CircularProgressIndicator(color: Colors.grey));
        } else if (movieProvider.geterrorMessage.isNotEmpty) {
          return Center(child: Text(movieProvider.geterrorMessage));
        }
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                !movieProvider.getisFetching) {
              movieProvider.loadMovies();
              return true;
            }
            return false;
          },
          child: ListView.builder(
            itemCount: movieProvider.getMovies.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: movieProvider.getMovies[index], child: MoviesWidget());
            },
          ),
        );
      }),
    );
  }
}
