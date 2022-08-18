import 'package:flutter/cupertino.dart';
import 'package:salafix/model/movieDetails.dart';

class MovieProvider with ChangeNotifier {
  MovieDetails? _movieDetails;
  MovieDetails? get movieDetails => _movieDetails;

  set movieDetailsData(MovieDetails value) {
    _movieDetails = value;
    notifyListeners();
  }
}
