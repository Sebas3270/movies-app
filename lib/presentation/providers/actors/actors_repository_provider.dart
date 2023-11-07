import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infrastructure/datasources/movidb_actors_datasource.dart';
import 'package:movies_app/infrastructure/repositories/actors_repository_implementation.dart';

final actorsRepositoryProvider = Provider((ref){
  return ActorsRepositoryImplementaton( ActorsMoviedbDatasource() );
});