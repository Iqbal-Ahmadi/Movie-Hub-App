import 'package:flutter/foundation.dart';
import 'package:mvvm_statemanagement/models/genre_model.dart';
import 'package:mvvm_statemanagement/models/movie_model.dart';
import 'package:mvvm_statemanagement/repository/movies_repo.dart';
import 'package:mvvm_statemanagement/service/getit_service.dart';

class MovieProvider with ChangeNotifier {
  Map<int, String> genreDict = {};
  Map<int, String> get getGenreDict => genreDict;

  final List<MovieModel> _movies = [];
  List<MovieModel> get getMovies => _movies;

  List<GenreModel> _genres = [];
  List get getgenres => _genres;

  int _currentPage = 1;

  bool _isFetching = false;
  bool get getisFetching => _isFetching;

  String _errorMessage = '';
  String get geterrorMessage => _errorMessage;

  Future<void> loadMovies() async {
    final repository = getit<MoviesRepository>();
    _isFetching = true;
    notifyListeners();
    try {
      if (_genres.isEmpty) {
        _genres = await repository.fetchGenres();
        for (var genre in _genres) {
          genreDict[genre.id!] = genre.name!;
        }
      }
      final List<MovieModel> movie =
          await repository.fetchMovies(page: _currentPage);
      _movies.addAll(movie);
      _currentPage++;
      print('the length of movies is ${_movies.length}');
    } catch (error) {
      _errorMessage = 'An error ocurred $error';
      rethrow;
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }
}
