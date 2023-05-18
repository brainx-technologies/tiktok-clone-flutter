import 'package:flutter/material.dart';
import 'package:tiktok_clone/data/models/question.dart';

import 'package:tiktok_clone/widgets/history_topic_widget.dart';
import 'package:tiktok_clone/widgets/play_list_widget.dart';
import 'package:tiktok_clone/widgets/right_items.dart';
import 'for_you_quiz_screen.dart';

class ForYouPageQuestion extends StatefulWidget {
  final Question data;

  const ForYouPageQuestion({super.key, required this.data});

  @override
  State<ForYouPageQuestion> createState() => _ForYouPageQuestionState();
}

class _ForYouPageQuestionState extends State<ForYouPageQuestion> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 0,
            bottom: 0,
            left: 16,
            right: 0,
            child: ForYourQuizScreen(question: widget.data)),
        Positioned(
          top: 0,
          right: 0,
          bottom: 70,
          child: RightItems(
            onStarButtonClicked: () {
              setState(() {});
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HistoryTopicWidget(
                name: widget.data.user?.name ?? "",
                description: widget.data.description ?? "",
              ),
              const SizedBox(height: 10),
              PlaylistWidget(data: widget.data.playlist ?? ""),
            ],
          ),
        ),
      ],
    );
  }
}
