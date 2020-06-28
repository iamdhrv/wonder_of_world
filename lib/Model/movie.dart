import 'dart:convert';

class Movie {
  final String title;
  final String image;
  final String details;

  Movie(this.title, this.image, this.details, );

  factory Movie.toObject(Map<String, dynamic> json) =>
      Movie(json['title'], json['image'], json['details']);

  Map<String, dynamic> toMap() => {'title': this.title, 'image': this.image, 'details': this.details};
}

List<Movie> getMovies(data) {
    final response = jsonDecode(data) as List;
    return response.map((json) => Movie.toObject(json)).toList();
  }