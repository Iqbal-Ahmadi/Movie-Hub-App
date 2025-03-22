import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mvvm_statemanagement/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider with ChangeNotifier {
  final List<MovieModel> _favoriteList = [];
  final favKey = 'favKey';

  List<MovieModel> get favoriteList => _favoriteList;

  void addorRemoveFavorite(MovieModel movieModel) {
    if (isFavorite(movieModel)) {
      _favoriteList.remove(movieModel);
    } else {
      _favoriteList.add(movieModel);
    }
    saveFavorite();
    notifyListeners();
  }

  bool isFavorite(MovieModel movieModel) {
    return _favoriteList.any((movie) => movie.id! == movieModel.id);
  }

  saveFavorite() async {
    final pref = await SharedPreferences.getInstance();
    final stringList =
        _favoriteList.map((movie) => json.encode(movie.toJson())).toList();
    pref.setStringList(favKey, stringList);
  }

  loadFavData() async {
    final pref = await SharedPreferences.getInstance();
    final prefString = pref.getStringList(favKey) ?? [];
    _favoriteList.clear();
    _favoriteList.addAll(
        prefString.map((movie) => MovieModel.fromJson(json.decode(movie))));
    notifyListeners();
  }

  clear() {
    _favoriteList.clear();
    notifyListeners();
  }
}
