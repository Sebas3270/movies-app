import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:movies_app/infrastructure/repositories/movie_repository_implementation.dart';

// Repositorio inmutable
final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImplementation( MovieDbDatasource() );
});