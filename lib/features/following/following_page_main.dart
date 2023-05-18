import 'package:flutter/material.dart';

import 'package:tiktok_clone/features/following/widget/answers/flash_card_answers.dart';
import 'package:tiktok_clone/features/following/widget/questions/flash_card_quiz_question_widget.dart';
import 'package:tiktok_clone/widgets/history_topic_widget.dart';

import 'package:tiktok_clone/data/models/flash_cards.dart';
import 'package:tiktok_clone/widgets/play_list_widget.dart';
import 'package:tiktok_clone/widgets/rating_widget.dart';
import 'package:tiktok_clone/widgets/right_items.dart';

class FollowingPageMain extends StatefulWidget {
  final Flashcard data;

  const FollowingPageMain({super.key, required this.data});

  @override
  State<FollowingPageMain> createState() => _FollowingPageMainState();
}

class _FollowingPageMainState extends State<FollowingPageMain> {
  bool isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 70, 0),
                  child: !isFlipped
                      ? FlashCardQuizQuestionWidget(data: widget.data)
                      : FlashCardAnswer(data: widget.data),
                ),
              ),
            ),
            const SizedBox(height: 10),
            isFlipped ? const RatingWidget() : Container(),
            HistoryTopicWidget(
              name: widget.data.user["name"],
              description: widget.data.description,
            ),
            const SizedBox(height: 10),
            PlaylistWidget(data: widget.data.playlist),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: RightItems(
            onStarButtonClicked: () {
              setState(() {
                isFlipped = !isFlipped;
              });
            },
          ),
        ),
      ],
    );
  }
}
