import 'package:imdb_flutter/data/mapper/movie_mapper.dart';
import 'package:imdb_flutter/data/remote/movie_api.dart';
import 'package:imdb_flutter/domain/entities/movie_data.dart';
import 'package:imdb_flutter/domain/repositories/movie_repository.dart';


class MovieRepositoryImpl implements MovieRepository{
  const MovieRepositoryImpl(this._movieApi);

  final MovieApi _movieApi;

  @override
  Future<List<MovieData>> getTrendingMovieOfThisWeek() async{
     final paginatedResponse = await _movieApi.getTrendingMoviesOfThisWeek();
     final movies = paginatedResponse.results;
     final data  = movies.map((movie) => movie.toData()).toList();
     return data;
  }
}