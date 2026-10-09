import 'package:cinemax/core/networking/api_constants.dart';
import 'package:cinemax/core/networking/api_result.dart';
import 'package:cinemax/feature/home/data/models/genre_model.dart';
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


  Future<ApiResult<List<GenreModel>>> getMoviesGenres() async{
    try{
      final response = await _dio.get(ApiConstants.movieGenres);

      final data = response.data as Map<String, dynamic>;
      final genresJson = data['genres'] as List<dynamic>;

      final genres = genresJson.map((genresJson){
        return GenreModel.fromJson(genresJson as Map<String, dynamic>);
      }).toList();
      return Success<List<GenreModel>>(genres);
    }catch(error){
      return const Error<List<GenreModel>>
        ('Could not load genres. Please try again');
    }
  }

}
