import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>((ref){

  final s1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final s2 = ref.watch(popularMoviesProvider).isEmpty;
  final s3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final s4 = ref.watch(upcomingMoviesProvider).isEmpty;

  return ( s1 || s2 || s3 || s4 );
});