import 'package:dio/dio.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/mappers/actors_mapper.dart';
import 'package:movies_app/infrastructure/models/moviedb/credits_response.dart';

class ActorsMoviedbDatasource extends ActorsDatasource{

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieKey,
      // 'language': 'es-MX',
    }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    final response = await dio.get(
      '/movie/$movieId/credits',
    );

    final creditsResponse = CreditsResponse.fromMap(response.data);
    final List<Actor> actors = creditsResponse.cast
      .map((actor) => ActorsMapper.castToEntity(actor))
      .toList();

    return actors;

  }
  
}