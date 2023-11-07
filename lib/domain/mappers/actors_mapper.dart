import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/infrastructure/models/moviedb/credits_response.dart';

class ActorsMapper {

  static Actor castToEntity( Cast cast ) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://www.macedonrangeshalls.com.au/wp-content/uploads/2017/10/image-not-found.png',
    character: cast.character
  );

}