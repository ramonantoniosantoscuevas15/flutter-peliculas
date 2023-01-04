import 'package:flutter/material.dart';
import 'package:pelicula_flutter/providers/movie_provider.dart';
import 'package:pelicula_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Peliculas en Cines'),
        elevation: 0,
        actions: [
          IconButton(onPressed: ()=> showSearch(context: context, delegate: MovieSearchDelegate()), icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children:  [
          //Tarjetas Principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),
          //Slider de Peliculas
          MovieSlider(
            movies : moviesProvider.popularMovies,
            title : 'Populares',
            onNextPage: ()=> moviesProvider.getpopularMovies(),
            ),
        ],
      )),
    );
  }
}
