import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/error_handling.dart';
import 'package:salafix/model/trending.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:salafix/utils/snack_bar.dart';

getTrending(BuildContext context) async {
  try {
    final provider = Provider.of<DataProvider>(context, listen: false);
    var response = await http.get(Uri.parse(trendingApi));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var trending = Trending.fromJson(jsonResponse);
    provider.trendingData = trending;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getPopular(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse(popularApi));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var popular = Trending.fromJson(jsonResponse);
    provider.popularData = popular;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getUpcoming(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse(upcomingApi));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var upcoming = Trending.fromJson(jsonResponse);
    provider.upcomingData = upcoming;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getTvPopular(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse(popularTvApi));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var tvPopular = Trending.fromJson(jsonResponse);
    provider.tvPopularData = tvPopular;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getTopRatedTv(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse(topRatedTvApi));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var tvTopRated = Trending.fromJson(jsonResponse);
    provider.topRatedTvData = tvTopRated;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getTopRatedMovie(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse(topRatedMovieApi));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var movieTopRated = Trending.fromJson(jsonResponse);
    provider.topRatedMovieData = movieTopRated;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}
