import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/entities/movie.dart';

class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({
    super.key, 
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: screenSize.height * 0.7,
      width: double.infinity,
      child: Swiper(
        // autoplay: true,
        // autoplayDelay: 2500,
        itemCount: movies.length,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
            size: 6.5,
          )
        ),
        itemBuilder: (context, index) => _MovieSlider(movie: movies[index]),
      ),
    );

  }
}

class _MovieSlider extends StatelessWidget {
  
  const _MovieSlider({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/movie/${movie.id}'),
      child: SizedBox.expand(
        child: Stack(
          children: [
            Image.network(
              width: double.infinity,
              movie.posterPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress != null){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
    
                return FadeIn(
                  // delay: const Duration(milliseconds: 300),
                  child: child
                );
              },
            ),
    
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.2,
                    0.8,
                  ],
                  colors: [
                    Colors.transparent,
                    Colors.black
                  ]
                )
              ),
            ),
    
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 40,
              child: FadeInRight(
                delay: const Duration(milliseconds: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28
                        ),
                      ),
    
                      const SizedBox(height: 10,),
    
                      Text(
                        "Now streaming",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
    
                      ),
    
                      // FilledButton.icon(
                      //   onPressed: () {}, 
                      //   icon: const Icon(Icons.play_arrow_outlined), 
                      //   label: Text(
                      //     "Now streaming",
                      //     style: TextStyle(
                      //       color: Colors.white.withOpacity(0.6),
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18
                      //     ),
                      //   ),
                      //   style: const ButtonStyle(
                      //     visualDensity: VisualDensity.comfortable
                      //   ),
                      // ),
                      
                    ],
                  ),
                ),
              ),
            )
    
          ],
        ),
      ),
    );
  }
}