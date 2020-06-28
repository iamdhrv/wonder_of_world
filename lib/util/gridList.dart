import 'package:flutter/material.dart';
import 'package:wonders_of_world/Model/movie.dart';
import 'package:wonders_of_world/Pages/details_screen.dart';
import 'package:wonders_of_world/config/random_color.dart';

class GridList extends StatefulWidget {
  const GridList({
    Key key,
    @required this.size,
    @required List<Movie> movies,
  }) : _movies = movies, super(key: key);

  final Size size;
  final List<Movie> _movies;

  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GridView.builder(
          padding: const EdgeInsets.only(top: 30),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  widget.size.width > 600 ? widget.size.width > 900 ? 4 : 3 : 2,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            final movie = widget._movies[index];
            final color = ColorGenerator.color;
            return InkResponse(
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => DetailsScreen(
                            movie: movie,
                            color: color,
                          ))),
              child: Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        blurRadius: 70,
                        spreadRadius: -25,
                        offset: Offset(0, 20),
                      ),
                      BoxShadow(
                        color: Colors.black.withAlpha(0x80),
                        blurRadius: 30,
                        spreadRadius: -20,
                        offset: Offset(0, 50),
                      )
                    ]),
                child: Hero(
                  tag: 'image_${movie.title}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Opacity(
                            opacity: 0.99,
                            child: Image.network(movie.image,
                                fit: BoxFit.cover)),
                        Opacity(
                            opacity: 0.6,
                            child: Container(color: Colors.black)),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(movie.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: widget._movies.length,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withAlpha(0x00)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
              )
            ],
          ),
        )
      ],
    );
  }
}
