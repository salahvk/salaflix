import 'package:flutter/cupertino.dart';
import 'package:salafix/model/credits.dart';
import 'package:salafix/model/getVideo.dart';
import 'package:salafix/model/person_model.dart';
import 'package:salafix/model/trending.dart';

class DataProvider with ChangeNotifier {
  int? homeIndex;

  homeindexData(int value) {
    homeIndex = value;
    notifyListeners();
  }

  // * Trending
  Trending? _trend;
  Trending? get trend => _trend;

  set trendingData(Trending value) {
    _trend = value;
    notifyListeners();
  }

// * Popular
  Trending? _popular;
  Trending? get popular => _popular;

  set popularData(Trending value) {
    _popular = value;
    notifyListeners();
  }

// * Popular Tv
  Trending? _tvPopular;
  Trending? get tvPopular => _tvPopular;

  set tvPopularData(Trending value) {
    _tvPopular = value;
    notifyListeners();
  }

// * Top Rated Movie
  Trending? _topRatedMovie;
  Trending? get topRatedMovie => _topRatedMovie;

  set topRatedMovieData(Trending value) {
    _topRatedMovie = value;
    notifyListeners();
  }

// * Top Rated Tv Shows
  Trending? _topRatedTv;
  Trending? get topRatedTv => _topRatedTv;

  set topRatedTvData(Trending value) {
    _topRatedTv = value;
    notifyListeners();
  }

// * Upcoming
  Trending? _upcoming;
  Trending? get upcoming => _upcoming;

  set upcomingData(Trending value) {
    _upcoming = value;
    notifyListeners();
  }

// * Search
  Trending? _search;
  Trending? get search => _search;

  set searchData(Trending value) {
    _search = value;
    notifyListeners();
  }

  void clean() {
    if (_search != null) {
      _search = null;
      print("null");
    }

    notifyListeners();
  }

  // * Cast
  Credits? _credit;
  Credits? get credit => _credit;

  set creditData(Credits value) {
    _credit = value;
    notifyListeners();
  }

  // * Clean credits

  void cleanCredits() {
    _credit = null;
    notifyListeners();
  }

  // * Trailer Videos
  Getvideo? _video;
  Getvideo? get video => _video;

  set videoData(Getvideo value) {
    _video = value;
    notifyListeners();
  }

  // * Clean video

  void cleanVideo() {
    _video = null;
    notifyListeners();
  }

  // * Personal Data

  PersonModel? _personModel;
  PersonModel? get personalModel => _personModel;

  set PersonalData(PersonModel value) {
    _personModel = value;
    notifyListeners();
  }

  // *Clear Personal Data

  void clearPersonalData() {
    _personModel = null;
    notifyListeners();
  }
}
