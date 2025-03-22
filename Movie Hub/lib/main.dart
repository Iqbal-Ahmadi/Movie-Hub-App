import 'package:flutter/material.dart';
import 'package:mvvm_statemanagement/screens/splash_screen.dart';
import 'package:mvvm_statemanagement/service/getit_service.dart';
import 'package:mvvm_statemanagement/service/navigator_service.dart';
import 'package:mvvm_statemanagement/view_model/favorite_provider.dart';
import 'package:mvvm_statemanagement/view_model/movie_provider.dart';
import 'package:mvvm_statemanagement/view_model/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider()),
        ChangeNotifierProvider<MovieProvider>(
            create: (context) => MovieProvider()),
        ChangeNotifierProvider<FavoriteProvider>(
            create: (context) => FavoriteProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, Theme, child) {
        return MaterialApp(
          navigatorKey: getit<NavigationService>().NavigatorKey,
          debugShowCheckedModeBanner: false,
          theme: Theme.themeData,
          home: SplashScreen(),
        );
      }),
    );
  }
}

// void removeBook(int index) {
//     setState(() {
//       favoriteBooks.removeWhere((book) => book['title'] == books[index]['title']);
//       books.removeAt(index);
//     });
//   }
