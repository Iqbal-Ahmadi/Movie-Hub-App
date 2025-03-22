import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_icons.dart';
import 'package:mvvm_statemanagement/view_model/favorite_provider.dart';
import 'package:provider/provider.dart';
import '../../models/movie_model.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, favorite, child) {
      return IconButton(
          onPressed: () {
            favorite.addorRemoveFavorite(movieModel);
          },
          icon: Icon(
            favorite.isFavorite(movieModel)
                ? MyAppIcons.favorite
                : MyAppIcons.favoriteOutline, //: MyAppIcons.favoriteOutline,
            size: 20,
            color: favorite.isFavorite(movieModel) ? Colors.red : null,
          ));
    });
  }
}
