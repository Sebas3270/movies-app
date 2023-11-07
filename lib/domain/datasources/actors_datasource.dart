import 'package:movies_app/domain/entities/actor.dart';

abstract class ActorsDatasource {
  
  Future<List<Actor>> getActorsByMovie( String movieId );

}