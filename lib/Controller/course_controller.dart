import 'dart:convert';
import 'package:cursoweb/Model/course_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CourseController {
  Future<List<CourseModel>> getAllCourses() async {
    var baseURL = Uri.parse('http://localhost:4000/api/courses/');
    final response = await http.get(baseURL);
    print('Response -> ${response.statusCode}');
    if (response.statusCode == 200) {
      return compute(parseCourses, response.body);
    } else if (response.statusCode == 401) {
      return null;
    }
    return null;
  }

  List<CourseModel> parseCourses(String body) {
    final parsed = jsonDecode(body).cast<Map<String, dynamic>>();
    return parsed
        .map<CourseModel>((json) => CourseModel.fromJson(json))
        .toList();
  }
}
