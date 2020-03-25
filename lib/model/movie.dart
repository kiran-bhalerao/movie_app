import 'package:movie_app/model/cast.dart';

class Movie {
  final String name;
  final String img;
  final double rating;
  final int score;
  final String rated;
  final String duration;
  final String plot;
  final List<String> tags;
  final List<Cast> casts;

  Movie(this.name, this.img, this.rating, this.score, this.rated, this.duration,
      this.plot, this.tags, this.casts);
}
