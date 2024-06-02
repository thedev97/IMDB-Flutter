import 'package:dio/dio.dart';
import 'package:imdb_flutter/data/remote/response/movie_response.dart';
import 'package:imdb_flutter/data/remote/response/paginated_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi()
@singleton
abstract class MovieApi {
  @factoryMethod
  factory MovieApi(Dio dio) = _MovieApi;

  @GET('/trending/movie/week')
  Future<PaginatedResponse<MovieResponse>> getTrendingMoviesOfThisWeek();
}
