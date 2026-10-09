import 'package:cinemax/feature/home/data/models/genre_model.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';

enum MoviesStatus { initial, loading, success, error }

class MoviesState {
  final MoviesStatus status;
  final List<MovieModel> movies;
  final List<GenreModel> genres;
  final int? selectedGenreId;
  final String? errorMessage;

  const MoviesState({
    this.status = MoviesStatus.initial,
    this.movies = const [],
    this.genres = const [],
    this.errorMessage,
    this.selectedGenreId,
  });


  List<MovieModel> get filteredMovies{
    final genreId = selectedGenreId;

    if(genreId == null){
      return movies;
    }

    return movies.where((movies){
      return movies.genreIds.contains(genreId);
    }).toList();


  }

}
