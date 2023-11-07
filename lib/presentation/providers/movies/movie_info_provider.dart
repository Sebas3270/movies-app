import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch( movieRepositoryProvider );
  return MovieMapNotifier(getMovieFuncion: movieRepository.getMovieById);
});

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallback getMovieFuncion;

  MovieMapNotifier({
    required this.getMovieFuncion
  }) : super({});

  Future<void> loadMovie( String movieId ) async {
    if(state[movieId] != null) return;

    final movie = await getMovieFuncion( movieId );
    state = { ...state, movieId: movie };
  }

}