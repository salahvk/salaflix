import 'package:flutter/cupertino.dart';
import 'package:salafix/model/trending.dart';

class DataProvider with ChangeNotifier {
  Trending? _trend;
  Trending? get trend => _trend;

  set trendingData(Trending value) {
    _trend = value;
    notifyListeners();
  }
}
