import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/error_handling.dart';
import 'package:salafix/model/getVideo.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:http/http.dart' as http;
import 'package:salafix/utils/snack_bar.dart';

getVideo(BuildContext context, String id) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response =
        await http.get(Uri.parse("$endPoint/movie/$id/videos$apiKey"));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var allVideos = Getvideo.fromJson(jsonResponse);
    provider.videoData = allVideos;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}

getTvVideo(BuildContext context, String id) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse("$endPoint/tv/$id/videos$apiKey"));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var allVideos = Getvideo.fromJson(jsonResponse);
    provider.videoData = allVideos;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}
