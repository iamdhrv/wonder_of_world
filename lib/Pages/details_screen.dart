import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:wonders_of_world/Model/movie.dart';
import 'package:wonders_of_world/config/header_clip.dart';
import 'package:wonders_of_world/util/hover_card.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;
  final Color color;

  const DetailsScreen({Key key, this.movie, this.color}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final aspect = size.height * 0.7;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Container(
                width: size.width,
                height: size.height,
                color: widget.color.withAlpha(030),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: 200,
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                color: widget.color,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: aspect * 0.66,
                  height: aspect * 0.7,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: widget.color,
                            blurRadius: 300,
                            spreadRadius: 20,
                            offset: Offset(0, 100))
                      ]),
                  child: HoverCard(
                    builder: (context, hover) {
                      return Hero(
                        tag: 'image_${widget.movie.title}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(widget.movie.image,
                              fit: BoxFit.fill),
                        ),
                      );
                    },
                    depth: 0,
                    depthColor: Colors.transparent,
                  ),
                ),
                Container(
                  height: size.height * 0.6,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(widget.movie.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            widget.movie.details,
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
