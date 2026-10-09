import 'package:cinemax/core/networking/api_result.dart';
import 'package:cinemax/feature/home/data/models/genre_model.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:cinemax/feature/home/data/repo/movies_repo.dart';

import 'movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo _moviesRepo;

  MoviesCubit(this._moviesRepo) : super(const MoviesState());

  Future<void> getPopularMovies() async {
    emit(const MoviesState(status: MoviesStatus.loading));

    final moviesResult = await _moviesRepo.getPopularMovies();

    if(isClosed) return;

    switch (moviesResult) {
      case Success<List<MovieModel>>():
        final genresResult =await _moviesRepo.getMoviesGenres();

        if(isClosed) return;
        final List<GenreModel> genres;
        switch (genresResult) {
          case Success<List<GenreModel>>():
            genres = genresResult.data;
          case Error<List<GenreModel>>():
            genres = const [];
        }
        emit(
            MoviesState(
                status: MoviesStatus.success,
                movies: moviesResult.data,
              genres: genres,
            ));
      case Error<List<MovieModel>>():
        emit(
          MoviesState(
              status: MoviesStatus.error,
              errorMessage: moviesResult.message),
        );

    }
  }

  void selectGenre(int? genreId){
    if (state.status != MoviesStatus.success || state.selectedGenreId == genreId){
      return;
    }

    emit(MoviesState(
      status: state.status,
      movies: state.movies,
      genres: state.genres,
      selectedGenreId: genreId,
      errorMessage: state.errorMessage,
    ));

  }

}
