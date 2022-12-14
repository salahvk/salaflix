import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/error_handling.dart';
import 'package:salafix/model/movieDetails.dart';
import 'package:http/http.dart' as http;
import 'package:salafix/provider/movie_details_provider.dart';
import 'package:salafix/utils/snack_bar.dart';

getMovieDetails(BuildContext context, String id) async {
  final provider = Provider.of<MovieProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse("$endPoint/movie/$id$apiKey"));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var data = MovieDetails.fromJson(jsonResponse);
    provider.movieDetailsData = data;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getTvDetails(BuildContext context, String id) async {
  final provider = Provider.of<MovieProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse("$endPoint/tv/$id$apiKey"));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var data = MovieDetails.fromJson(jsonResponse);
    provider.movieDetailsData = data;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}
