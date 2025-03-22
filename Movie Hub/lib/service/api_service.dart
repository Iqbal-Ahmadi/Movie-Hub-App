import 'dart:convert';
import 'package:mvvm_statemanagement/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_statemanagement/models/genre_model.dart';
import 'package:mvvm_statemanagement/models/movie_model.dart';

class APIService {
  Future<List<MovieModel>> fetchMovies({int? page}) async {
    final url = Uri.parse(
        '${ApiConstant.Base_Url}/movie/popular?language=en-US&page=$page');
    final response = await http.get(url, headers: ApiConstant.header);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return List.from(
          data['results'].map((element) => MovieModel.fromJson(element)));
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }

  Future<List<GenreModel>> fetchGenres() async {
    final url =
        Uri.parse('${ApiConstant.Base_Url}/genre/movie/list?language=en');
    final response = await http.get(url, headers: ApiConstant.header);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List.from(data['genres'].map((element)=> GenreModel.tojson(element)));
      // return data;
      // print(data.toString());
    } else {
      throw Exception('Failed to load movies: ${response.statusCode}');
    }
  }
}
