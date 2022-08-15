import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/model/credits.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:http/http.dart' as http;

getCredits(BuildContext context, String id) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  var response =
      await http.get(Uri.parse("$endPoint/movie/$id/credits$apiKey"));
  var jsonResponse = jsonDecode(response.body);
  var allCredits = Credits.fromJson(jsonResponse);
  provider.creditData = allCredits;
}
