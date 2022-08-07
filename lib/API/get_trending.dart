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
  // print(response.body);
  var jsonResponse = jsonDecode(response.body);
  var trending = Trending.fromJson(jsonResponse);
  provider.trendingData = trending;

  print(provider.trend);
}
