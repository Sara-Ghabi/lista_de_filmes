import 'package:get_it/get_it.dart';
import 'package:lista_de_filmes/data/movie_api.dart';
import 'package:lista_de_filmes/pages/movie_list/movie_list_controller.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerLazySingleton<MovieApi>(() => MovieApi());
  getIt.registerLazySingleton<MovieListController>(() => MovieListController());
}
