import 'package:cinemax/core/networking/dio_factory.dart';
import 'package:cinemax/feature/home/data/repo/movies_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<MoviesRepo>(() => MoviesRepo(getIt<Dio>()));
}
