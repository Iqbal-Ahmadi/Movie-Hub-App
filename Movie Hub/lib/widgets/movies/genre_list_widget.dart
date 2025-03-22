import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class GenreListWidget extends StatelessWidget {
  const GenreListWidget({super.key,required this.genreId});
  final List<int>? genreId;

  @override
  Widget build(BuildContext context) {
    final genreModelProvider = Provider.of<MovieProvider>(context);
    final genreDict = genreModelProvider.getGenreDict;
    return Wrap(
      children: List.generate(
        genreId!.length,
        (index) {
          return chipWidget(genreName: genreDict[genreId![index]], context: context);
        },
      ),
    );
  }

  Widget chipWidget({required String? genreName, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(
                alpha: 0.2, red: 0.3),
            border: Border.all(color: Theme.of(context).colorScheme.surface),
            borderRadius: BorderRadius.circular(30.0)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName!,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
