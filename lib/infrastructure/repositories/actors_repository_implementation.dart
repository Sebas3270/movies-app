import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/repositories/actors_repository.dart';

class ActorsRepositoryImplementaton extends ActorsRepository {

  final ActorsDatasource datasource;

  ActorsRepositoryImplementaton(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
  
}