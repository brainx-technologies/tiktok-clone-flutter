import 'package:flutter/material.dart';
import 'package:tiktok_clone/data/models/flash_cards.dart';
import 'flash_card_quiz_question_text_widget.dart';

class FlashCardQuizQuestionWidget extends StatelessWidget {
  const FlashCardQuizQuestionWidget({super.key, required this.data});
  final Flashcard data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 84),
        FlashCardQuizQuestionTextWidget(data: data),
      ],
    );
  }
}
