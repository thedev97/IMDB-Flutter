import 'package:imdb_flutter/domain/entities/movie_data.dart';

abstract class MovieRepository{
  Future<List<MovieData>> getTrendingMovieOfThisWeek();
}