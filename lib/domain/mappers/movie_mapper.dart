import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:movies_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  
  static Movie movieDbToEntity(MovieMovieDb movieDb) => Movie(
    adult: movieDb.adult, 
    backdropPath: movieDb.backdropPath != '' 
    ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
    : 'https://www.macedonrangeshalls.com.au/wp-content/uploads/2017/10/image-not-found.png', 
    genreIds: movieDb.genreIds.map((genreId) => genreId.toString()).toList(), 
    id: movieDb.id, 
    originalLanguage: movieDb.originalLanguage, 
    originalTitle: movieDb.originalTitle, 
    overview: movieDb.overview, 
    popularity: movieDb.popularity, 
    posterPath: movieDb.posterPath != '' 
    ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
    : 'no-poster',
    releaseDate: movieDb.releaseDate, 
    title: movieDb.title, 
    video: movieDb.video, 
    voteAverage: movieDb.voteAverage, 
    voteCount: movieDb.voteCount
  );

  static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
    adult: movieDb.adult, 
    backdropPath: movieDb.backdropPath != '' 
    ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
    : 'https://www.macedonrangeshalls.com.au/wp-content/uploads/2017/10/image-not-found.png', 
    genreIds: movieDb.genres.map((genreId) => genreId.toString()).toList(), 
    id: movieDb.id, 
    originalLanguage: movieDb.originalLanguage, 
    originalTitle: movieDb.originalTitle, 
    overview: movieDb.overview, 
    popularity: movieDb.popularity, 
    posterPath: movieDb.posterPath != '' 
    ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
    : 'no-poster',
    releaseDate: movieDb.releaseDate, 
    title: movieDb.title, 
    video: movieDb.video, 
    voteAverage: movieDb.voteAverage, 
    voteCount: movieDb.voteCount
  );

}