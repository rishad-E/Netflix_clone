// ignore_for_file: sized_box_for_whitespace, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netflixclone/fonts/text.dart';
import 'package:netflixclone/widgets/description.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextModifier(
            text: 'Top Rated movies',
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: topRated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                    name: topRated[index]['title'],
                                    description: topRated[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[index]['poster_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[index]['poster_path'],
                                    release_on: topRated[index]['release_date'],
                                    vote: topRated[index]['vote_average']
                                        .toString(),
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
                                        topRated[index]['poster_path']),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            child: TextModifier(
                                text: topRated[index]['title'] ??
                                    topRated[index]['name'],
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
