import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_flutter/app/ui/screens/main/home/home_view_model.dart';
import 'package:imdb_flutter/app/ui/screens/main/home/widgets/movie_item.dart';
import 'package:imdb_flutter/domain/bloc/home_bloc.dart';
import 'package:imdb_flutter/domain/state/home_state.dart';
import 'package:imdb_flutter/library/resource/typography.dart';
import 'package:imdb_localization/strings.g.dart';

const _categoryHeight = 312.0;

class IMDBHome extends StatefulWidget {
  const IMDBHome({
    required this.viewModel,
    super.key,
  });

  final IMDBHomeViewModel viewModel;

  @override
  State<IMDBHome> createState() => _IMDBHomeState();
}

class _IMDBHomeState extends State<IMDBHome> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.viewModel.fetchTrendingMovies(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.0),
              _TrendingMoviesWidget(),
              SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendingMoviesWidget extends StatelessWidget {
  const _TrendingMoviesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            context.t.home.trendingThisWeek,
            style: AppTypography.title,
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: _categoryHeight,
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (_, state) => state is TrendingMoviesHomeState,
            builder: (context, state) {
              if (state is FetchedTrendingMoviesHomeState) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movies.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                  itemBuilder: (_, index) {
                    final movie = state.movies[index];
                    return Row(
                      children: [
                        if (index == 0) const SizedBox(width: 16.0),
                        MovieItem(
                          movie: movie,
                          index: index + 1,
                        ),
                        if (index == state.movies.length - 1)
                          const SizedBox(width: 16.0),
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}