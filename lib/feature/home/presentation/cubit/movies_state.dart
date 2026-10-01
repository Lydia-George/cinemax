import 'package:cinemax/feature/home/data/models/movie_model.dart';

enum MoviesStatus { initial, loading, success, error }

class MoviesState {
  final MoviesStatus status;
  final List<MovieModel> movies;
  final String? errorMessage;

  const MoviesState({
    this.status = MoviesStatus.initial,
    this.movies = const [],
    this.errorMessage,
  });
}
