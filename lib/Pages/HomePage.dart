import 'package:flutter/material.dart';
import 'package:wonders_of_world/Model/Categories.dart';
import 'package:wonders_of_world/Model/movie.dart';
import 'package:wonders_of_world/util/gridList.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: mainAppBar(categories),
        body: TabBarView(
          children: List<Widget>.generate(categories.length, (int index) {
            return new GridList(size: size, movies: getMovies(categories[index].datails));
          }),
        ),
      ),
    );
  }

  AppBar mainAppBar(List<Category> categories) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          unselectedLabelColor: Colors.black87,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.grey),
          isScrollable: true,
          tabs: List<Widget>.generate(categories.length, (int index) {
            return new Tab(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: 10,
                  right: index == categories.length - 1 ? 20 : 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    categories[index].tab,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                ),
              ),
            );
          }),
        ),
        title: Text('wonders of world',
                style: TextStyle(fontSize: 28, color: Colors.black87, fontWeight: FontWeight.w600)),
      );
  }
}
