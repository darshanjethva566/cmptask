import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DataService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await _dio.get('https://raw.githubusercontent.com/mwgg/Airports/master/airports.json');
      final data = response.data;
     // debugPrint("Data is: $data");
      debugPrint('Data type is : ${data.runtimeType}');
      final tempData = jsonDecode(data);
      debugPrint('tempData type is : ${tempData.runtimeType}');


      // Ensure that the data is of the correct type before returning it
      if (tempData is Map<String, dynamic>) {
        return tempData;
      } else {
        throw Exception('Data format is not as expected');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
