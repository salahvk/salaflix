import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/model/trending.dart';
import 'package:salafix/provider/data_provider.dart';

getTrending(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  var response = await http.get(Uri.parse(trendingApi));
  var jsonResponse = jsonDecode(response.body);
  var trending = Trending.fromJson(jsonResponse);
  provider.trendingData = trending;

  print(provider.trend);
}

getPopular(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  var response = await http.get(Uri.parse(popularApi));
  var jsonResponse = jsonDecode(response.body);
  var popular = Trending.fromJson(jsonResponse);
  provider.popularData = popular;

  print(provider.popular);
}

getUpcoming(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  var response = await http.get(Uri.parse(upcomingApi));
  var jsonResponse = jsonDecode(response.body);
  var upcoming = Trending.fromJson(jsonResponse);
  provider.upcomingData = upcoming;

  print(provider.upcoming);
}
