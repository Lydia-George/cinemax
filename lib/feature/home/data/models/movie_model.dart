class MovieModel {
  final int id;
  final String title;
  final String overview;

  // poster path : for vertical img |
  final String? posterPath;
  final double voteAverage;

  // backdrop path : for horizontal img _
  final String? backdropPath;
  final String releaseDate;

  final List<int> genreIds;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.backdropPath,
    required this.releaseDate,
    required this.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] as String? ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((id) => id as int)
          .toList(),
    );
  }
}
