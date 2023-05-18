import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tiktok_clone/data/models/flash_cards.dart';

class FlashcardProvider with ChangeNotifier {
  List<Flashcard> _flashcards = [];

  List<Flashcard> get flashcards => _flashcards;

  Future<void> getFlashcards() async {
    final response = await http
        .get(Uri.parse('https://cross-platform.rp.devfactory.com/following'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      if (json['type'] == 'flashcard') {
        _flashcards = [Flashcard.fromJson(json)];
      } else if (json['type'] == 'flashcard_list') {
        final jsonList = json['flashcards'] as List<dynamic>;
        _flashcards = jsonList.map((json) => Flashcard.fromJson(json)).toList();
      } else {
        throw Exception('Invalid response type');
      }
      notifyListeners();
    } else {
      throw Exception('Failed to load flashcards');
    }
  }
}
