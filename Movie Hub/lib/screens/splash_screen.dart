import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/screens/movie_secreen.dart';
import 'package:mvvm_statemanagement/view_model/favorite_provider.dart';
import 'package:mvvm_statemanagement/view_model/movie_provider.dart';
import 'package:mvvm_statemanagement/widgets/error_widget.dart';
import 'package:provider/provider.dart';

import '../service/getit_service.dart';
import '../service/navigator_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<void> _loadMoviesFuture;
  // bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _loadMoviesFuture = loadMoviesData();
  }

  Future<void> loadMoviesData() async {
    await Future.microtask(() async {
      if (!mounted) return;
      await Provider.of<MovieProvider>(context, listen: false).loadMovies();
      if (!mounted) return;
      await Provider.of<FavoriteProvider>(context, listen: false).loadFavData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _loadMoviesFuture, //loadMoviesData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('loading...'),
                      SizedBox(height: 10),
                      CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                // Provider.of<MovieProvider>(context, listen: false).loadMovies();
                return Consumer<MovieProvider>(builder: (context, data, child) {
                  if (data.getgenres.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) async {
                      await getit<NavigationService>()
                          .navigatereplace(MovieScreen());
                    });
                  }
                  return data.getisFetching
                      ? Center(child: CircularProgressIndicator())
                      : errorWidget(
                          errorText: snapshot.error.toString(),
                          retryFunction: () async {
                            await loadMoviesData();
                          },
                        );
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  await getit<NavigationService>()
                      .navigatereplace(MovieScreen());
                });
                return SizedBox.shrink();
              }
            }));
  }
}
