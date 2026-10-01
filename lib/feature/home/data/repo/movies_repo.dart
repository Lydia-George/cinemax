import 'package:cinemax/core/networking/api_constants.dart';
import 'package:cinemax/core/networking/api_result.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:dio/dio.dart';

class MoviesRepo {
  final Dio _dio;

  MoviesRepo(this._dio);

  Future<ApiResult<List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await _dio.get(ApiConstants.popularMovies);

      final data = response.data as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      final movies = results.map((movieJson) {
        return MovieModel.fromJson(movieJson as Map<String, dynamic>);
      }).toList();

      return Success<List<MovieModel>>(movies);
    } catch (error) {
      return const Error<List<MovieModel>>(
        'Could not load movies. Please try again.',
      );
    }
  }
}
