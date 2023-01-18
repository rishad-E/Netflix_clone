// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:netflixclone/fonts/text.dart';
import 'package:netflixclone/widgets/description.dart';

class TvShows extends StatelessWidget {
  final List tv;
  const TvShows({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextModifier(
              text: 'Popular Tv Shows', color: Colors.white, size: 20),
          const SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                    name: tv[index]['title'],
                                    description: tv[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                    release_on: tv[index]['release_date'],
                                    vote: tv[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['poster_path']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: TextModifier(
                                text: tv[index]['title'] ?? tv[index]['name'],
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
