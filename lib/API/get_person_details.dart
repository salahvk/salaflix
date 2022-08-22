import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salafix/API/end_point.dart';
import 'package:salafix/API/error_handling.dart';
import 'package:salafix/model/person_model.dart';
import 'package:salafix/provider/data_provider.dart';
import 'package:http/http.dart' as http;
import 'package:salafix/utils/snack_bar.dart';

getPerson(BuildContext context, String id) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(Uri.parse("$endPoint/person/$id$apiKey"));
    errorHandling(response, context);
    var jsonResponse = jsonDecode(response.body);
    var personalData = PersonModel.fromJson(jsonResponse);
    provider.PersonalData = personalData;
  } on Exception catch (_) {
    showSnackBar("Something Went Wrong", context);
  }
}
