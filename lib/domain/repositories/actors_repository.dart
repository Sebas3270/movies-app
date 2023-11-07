import 'package:movies_app/domain/entities/actor.dart';

abstract class ActorsRepository {
  
  Future<List<Actor>> getActorsByMovie( String movieId );

}