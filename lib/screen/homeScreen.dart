// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:netflixclone/widgets/toprated.dart';
import 'package:netflixclone/widgets/trendingMovies.dart';
import 'package:netflixclone/widgets/tvshows.dart';
import 'package:netflixclone/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List upcomingMovies =[];
  List trendigMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final String apikey = '6a01e3c8ea8ef257b4f2bd076eee308a';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTAxZTNjOGVhOGVmMjU3YjRmMmJkMDc2ZWVlMzA4YSIsInN1YiI6IjYzYWFkZmEwNWFkNzZiMDA3ZGM1ODExMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YRVtUg22cJOYK6Yif8xgpyiFHIXxUJIQBi0Zo3hAm-g';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map upcomingMoviesResults =await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map trendigResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResults =await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    

    setState(() {
      upcomingMovies = upcomingMoviesResults['results'];
      trendigMovies = trendigResults['results'];
      topRatedMovies = topRatedMoviesResults['results'];
      tvShows = tvShowsResults['results'];
    });
    // print(trendigMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // toolbarHeight:80,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:
         Image.asset('assets/image/netflix-logo.png',height:80)
      ),
      body: ListView(
        children: [
          UpcomingMovies(upcoming: upcomingMovies),
          TopRated(topRated: topRatedMovies),
          TrendingMovies(trending: trendigMovies),
          TvShows(tv: tvShows)
        ],
      ),
    );
  }
}
