// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:netflixclone/fonts/text.dart';

class MovieDescription extends StatelessWidget {
  String? name, description, bannerurl, posterurl, vote, release_on;
  MovieDescription(
      {super.key,
      this.name,
      this.description,
      this.bannerurl,
      this.vote,
      this.release_on,
      this.posterurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 350,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerurl ?? 'default',
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: TextModifier(
                        text:
                            '   ⭐Avearge Rating:${vote ?? 'Rating is not defined'}',
                        color: Colors.white,
                        size: 16),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextModifier(
                  text: name ?? 'not loaded', color: Colors.white, size: 24),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: TextModifier(
                  text: 'Releasing on -${release_on ?? 'defalut'}',
                  color: Colors.white,
                  size: 14),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl ?? 'defult'),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: TextModifier(
                        text: description ?? 'default',
                        color: Colors.white,
                        size: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
