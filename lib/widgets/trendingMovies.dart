// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netflixclone/fonts/text.dart';
import 'package:netflixclone/widgets/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextModifier(
              text: 'Trending movies', color: Colors.white, size: 20),
          const SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                    name: trending[index]['title'],
                                    description: trending[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    vote: trending[index]['vote_average']
                                        .toString(),
                                    release_on: trending[index]['release_date'],
                                  )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path']),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: TextModifier(
                                text: trending[index]['title'] ??
                                    trending[index]['name'],
                                color: Colors.white,
                                size: 16),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
