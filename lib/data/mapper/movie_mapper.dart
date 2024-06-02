import 'package:imdb_flutter/app/utils/app_utils.dart';
import 'package:imdb_flutter/data/remote/response/movie_response.dart';
import 'package:imdb_flutter/domain/entities/movie_data.dart';

extension MovieMapper on MovieResponse {
  MovieData toData() => MovieData(
      id: id,
      title: title,
      rating: voteAverage,
      posterUrl: AppUtils.addBaseImageUrl(posterPath));
}
