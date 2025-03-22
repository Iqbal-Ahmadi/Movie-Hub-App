import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/constants/my_app_icons.dart';
import 'package:mvvm_statemanagement/view_model/favorite_provider.dart';
import 'package:mvvm_statemanagement/widgets/movies/movies_widget.dart';
import 'package:provider/provider.dart';

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
        actions: [
          IconButton(
              onPressed: () {
                favoriteProvider.clear();
              },
              icon: const Icon(
                MyAppIcons.deleteIcon,
                color: Colors.red,
              ))
        ],
      ),
      body: favoriteProvider.favoriteList.isEmpty
          ? Center(child: Text('No favorite data added'))
          : ListView.builder(
              itemCount: favoriteProvider.favoriteList.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value:
                        favoriteProvider.favoriteList.reversed.toList()[index],
                    child: MoviesWidget());
              },
            ),
    );
  }
}
