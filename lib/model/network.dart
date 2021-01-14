import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

List<jobmodels> parseJobmodels(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  // ignore: non_constant_identifier_names
  List<jobmodels> Jobmodels = list.map((model) => jobmodels.fromJson(model)).toList();
  return Jobmodels;
}

Future<List<jobmodels>> fetchjobmodels() async {
  final response = await http.get('https://jobs.github.com/positions.json?search=node');

  if (response.statusCode == 200) {
    return compute(parseJobmodels, response.body);
  } else {
    throw Exception('Request API Erorr');
  }
}

