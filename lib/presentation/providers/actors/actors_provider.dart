import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/presentation/providers/actors/actors_repository_provider.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch( actorsRepositoryProvider );
  return ActorsByMovieNotifier(getActorsFunction: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallback getActorsFunction;

  ActorsByMovieNotifier({
    required this.getActorsFunction
  }) : super({});

  Future<void> loadActors( String movieId ) async {
    if(state[movieId] != null) return;

    final actors = await getActorsFunction( movieId );
    state = { ...state, movieId: actors };
  }

}