import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tiktok_clone/global/api_endpoints.dart';

import 'package:tiktok_clone/data/models/question.dart';

class QuestionProvider with ChangeNotifier {
  late Question _question;

  Question get question => _question;

  Future<void> fetchQuestion() async {
    const url = APIEndpoints.forYou;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      _question = Question.fromJson(json);
      // final id = json['id'];
      // final playlist = json['playlist'];
      // final description = json['description'];
      // final question = json['question'];
      // final user = json['user'];

      // final optionsJson = json['options'] as List<dynamic>;
      // final options = optionsJson
      //     .map((optionJson) => Option(
      //           id: optionJson['id'],
      //           answer: optionJson['answer'],
      //         ))
      //     .toList();

      // _question = Question(
      //   id: id,
      //   playlist: playlist,
      //   description: description,
      //   question: question,
      //   options: options,
      //   user: user,
      // );

      notifyListeners();
    } else {
      throw Exception('Failed to load question');
    }
  }
}
