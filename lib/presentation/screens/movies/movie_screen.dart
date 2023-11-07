import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/presentation/providers/actors/actors_provider.dart';
import 'package:movies_app/presentation/providers/movies/movie_info_provider.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({
    super.key,
    required this.movieId
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {

    final movie = ref.watch(movieInfoProvider)[widget.movieId];
    final cast = ref.watch(actorsByMovieProvider)[widget.movieId];

    if(movie == null || cast == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }


    // return Scaffold(
    //   appBar: AppBar(
    //     foregroundColor: Colors.white,
    //     actions: [
    //       Icon(EvaIcons.bookmarkOutline)
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(10),
    //             child: Image.network(
    //               movie.backdropPath,
    //               loadingBuilder: (context, child, loadingProgress) {
    //                 if(loadingProgress != null){
    //                   return const SizedBox.expand(child: CircularProgressIndicator());
    //                 }
    //                 return child;
    //               },
    //             ),
    //           ),
      
    //           const SizedBox(height: 20,),
      
    //           Text(
    //             movie.title,
    //             style: const TextStyle(
    //               fontSize: 35,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),

    //           const SizedBox(height: 10,),
      
    //           Text(
    //             movie.overview,
    //             style: const TextStyle(
    //               fontSize: 15,
    //             ),
    //           ),
              
    //         ],
    //       ),
    //     ),
    //   ),
    // );


    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: IconButton(
              icon: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Theme.of(context).colorScheme.primary,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white
                  )
                )
              ),
              onPressed: () => context.pop(),
            ),
            foregroundColor: Colors.white,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            flexibleSpace: FlexibleSpaceBar(
              
              title: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                // child: Text(movie.title),
              ),

              background: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.network(
                      movie.backdropPath,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          0.0,
                          0.35
                        ],
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ]
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),

                    _DateReviewBanner(movie: movie),

                    const SizedBox(height: 10,),

                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    FilledButton.icon(
                      style: const ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size.fromHeight(40)),
                      ),
                      onPressed: () {
                        
                      }, 
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play now')
                    ),

                    const SizedBox(height: 10,),

                    Text(
                      movie.overview,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'Cast',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        const SizedBox(height: 10,),

                        SizedBox(
                          height: 1000,
                          child: ListView.separated(
                            itemCount: cast.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => const SizedBox(width: 15,),
                            itemBuilder: (context, index) {
                              
                              final actor = cast[index];
                        
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      height: 200,
                                      child: AspectRatio(
                                        aspectRatio: 9/12,
                                        child: Image.network(
                                          actor.profilePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 5,),

                                  Text(
                                    actor.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              );
                        
                            },
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
              childCount: 1
            )
          
          ),
        ],
      )
    );
  }
}

class _DateReviewBanner extends StatelessWidget {
  
  const _DateReviewBanner({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(

          child: Row(
            children: [
              Icon(Icons.star, color: Theme.of(context).colorScheme.secondary, size: 20,),

              const SizedBox(width: 5,),

              Text(
                movie.voteAverage.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),


        SizedBox(

          child: Row(
            children: [

              Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.secondary, size: 20,),

              const SizedBox(width: 5,),

              Text(
                "${movie.releaseDate.year}-${movie.releaseDate.month}-${movie.releaseDate.day}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),

        
      ],
    );
  }
}