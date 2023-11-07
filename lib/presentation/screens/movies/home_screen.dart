import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';
import 'package:movies_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {

  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const CustomLoader();

    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    if(slideshowMovies.isEmpty){ 
      return const Center(
        child: CircularProgressIndicator()
      );
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
    
          MoviesSlideshow(movies: slideshowMovies),

          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Top Rated',
            loadNextPage: (){
              ref.read(topRatedMoviesProvider.notifier).loadNextPage();
            },
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Now playing',
            loadNextPage: (){
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),

          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Popular',
            loadNextPage: (){
              ref.read(popularMoviesProvider.notifier).loadNextPage();
            },
          ),

          MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Upcoming',
            loadNextPage: (){
              ref.read(upcomingMoviesProvider.notifier).loadNextPage();
            },
          ),

          
        ]
      ),
    );
  }
}