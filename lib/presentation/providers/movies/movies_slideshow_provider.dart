import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref){

  final nowPlayingMovies = ref.watch(popularMoviesProvider);
  if( nowPlayingMovies.isEmpty ) return [];
  return nowPlayingMovies.sublist(0,5);

});