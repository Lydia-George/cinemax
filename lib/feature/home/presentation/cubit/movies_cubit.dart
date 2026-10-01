import 'package:cinemax/core/networking/api_result.dart';
import 'package:cinemax/feature/home/data/models/movie_model.dart';
import 'package:cinemax/feature/home/data/repo/movies_repo.dart';

import 'movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepo _moviesRepo;

  MoviesCubit(this._moviesRepo) : super(const MoviesState());

  Future<void> getPopularMovies() async {
    emit(const MoviesState(status: MoviesStatus.loading));

    final result = await _moviesRepo.getPopularMovies();

    switch (result) {
      case Success<List<MovieModel>>():
        emit(MoviesState(status: MoviesStatus.success, movies: result.data));
      case Error<List<MovieModel>>():
        emit(
          MoviesState(status: MoviesStatus.error, errorMessage: result.message),
        );

    }
  }
}
