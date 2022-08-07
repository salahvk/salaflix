import 'package:flutter/cupertino.dart';
import 'package:salafix/model/trending.dart';

class DataProvider with ChangeNotifier {
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

// * Upcoming
  Trending? _upcoming;
  Trending? get upcoming => _upcoming;

  set upcomingData(Trending value) {
    _upcoming = value;
    notifyListeners();
  }
}
