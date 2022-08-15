import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/model/getVideo.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:http/http.dart' as http;

getVideo(BuildContext context, String id) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  var response = await http.get(Uri.parse("$endPoint/movie/$id/videos$apiKey"));
  var jsonResponse = jsonDecode(response.body);
  var allVideos = Getvideo.fromJson(jsonResponse);
  provider.videoData = allVideos;
}
