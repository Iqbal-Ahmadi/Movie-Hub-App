import 'package:mvvm_statemanagement/models/genre_model.dart';
import 'package:mvvm_statemanagement/service/api_service.dart';

import '../models/movie_model.dart';

class MoviesRepository {
  final _apiService = APIService();

  Future<List<MovieModel>> fetchMovies({int? page}) async {
    return _apiService.fetchMovies(page: page);
  }
  
  // List<GenreModel> cachedGenres= [];

  Future<List<GenreModel>> fetchGenres() async {
    return await _apiService.fetchGenres();
  }
  
  // Map<int,String> genreDict ={};
  // void makeGenreDictionary(){
  //   for(var genre in cachedGenres){
  //     genreDict[genre.id!]=genre.name!;
  //   }
  // }
}
