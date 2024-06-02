import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_flutter/domain/bloc/home_bloc.dart';
import 'package:imdb_flutter/domain/event/home_event.dart';

class IMDBHomeViewModel {
  void fetchTrendingMovies(BuildContext context) {
    context.read<HomeBloc>().add(FetchTrendingMoviesHomeEvent());
  }
}