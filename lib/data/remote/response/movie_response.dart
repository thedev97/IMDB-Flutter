import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieResponse {
  const MovieResponse(
      {required this.id,
      required this.title,
      required this.voteAverage,
      required this.posterPath});

  final int id;
  final String title;
  final double voteAverage;
  final String posterPath;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}
