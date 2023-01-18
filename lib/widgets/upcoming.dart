// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:netflixclone/fonts/text.dart';
import 'package:netflixclone/widgets/description.dart';

class UpcomingMovies extends StatelessWidget {
  List upcoming;
  UpcomingMovies({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextModifier(
            text: 'Upcoming movies',
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(height: 10),
          Container(
            // color: Colors.amberAccent,
            height: 310,
            child: ListView.builder(
                itemCount: upcoming.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                    name: upcoming[index]['title'],
                                    description: upcoming[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            upcoming[index]['poster_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            upcoming[index]['poster_path'],
                                    release_on: upcoming[index]['release_date'],
                                    vote: upcoming[index]['vote_average']
                                        .toString(),
                                  )));
                    },
                    child: Container(
                      padding:const EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 260,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          upcoming[index]['poster_path']),
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: TextModifier(
                                text: upcoming[index]['title'] ??
                                    upcoming[index]['name'],
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
