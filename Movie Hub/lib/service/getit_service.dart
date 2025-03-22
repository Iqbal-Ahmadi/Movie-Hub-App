import 'package:get_it/get_it.dart';
import 'package:mvvm_statemanagement/repository/movies_repo.dart';
import 'package:mvvm_statemanagement/service/api_service.dart';
import 'package:mvvm_statemanagement/service/navigator_service.dart';

GetIt getit = GetIt.instance;

void setUpLocator() {
  getit.registerLazySingleton<NavigationService>(() => NavigationService());
  getit.registerLazySingleton<APIService>(() => APIService());
  getit.registerLazySingleton<MoviesRepository>(() => MoviesRepository());
}
