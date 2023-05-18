import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tiktok_clone/data/models/question.dart';
import 'package:tiktok_clone/global/images.dart';
import 'package:tiktok_clone/features/foryou/for_you_quiz_opion_screen.dart';

class ForYourQuizScreen extends StatefulWidget {
  final Question question;

  const ForYourQuizScreen({super.key, required this.question});

  @override
  ForYourQuizScreenState createState() => ForYourQuizScreenState();
}

class ForYourQuizScreenState extends State<ForYourQuizScreen> {
  String? _selectedOptionId;
  String? _correctOptionId;
  bool _isAnswered = false;
  bool _isLoading = false;

  final Map<String, AssetImage> _optionImageMap = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 70, top: 20),
              child: Text(
                widget.question.question ?? "",
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.question.options?.length,
                itemBuilder: (context, index) {
                  final option = widget.question.options?[index];
                  final optionId = option?.id;
                  final isSelected = optionId == _selectedOptionId;
                  final isCorrect = optionId == _correctOptionId;
                  final isAnswered = _isAnswered;

                  final image = _optionImageMap[optionId];
                  Widget? imageWidget;
                  if (image != null && (isSelected || isAnswered)) {
                    imageWidget = Image(image: image);
                  }

                  return ForYouQuizOptionScreen(
                    option: option?.answer ?? "",
                    isSelected: isSelected,
                    isCorrect: isCorrect,
                    isAnswered: isAnswered,
                    imageWidget: imageWidget,
                    onTap: () async {
                      setState(() {
                        _selectedOptionId = optionId;
                        _isLoading = true;
                      });

                      final response = await http.get(Uri.parse(
                          'https://cross-platform.rp.devfactory.com/reveal?id=${widget.question.id}'));

                      final data = jsonDecode(response.body);
                      final correctOptionId =
                          data['correct_options'][0]['id'] as String;

                      final optionImage = isCorrect
                          ? const AssetImage(Images.correct)
                          : const AssetImage(Images.wrong);
                      const correctOptionImage = AssetImage(Images.correct);

                      if (isCorrect) {
                        setState(() {
                          _isAnswered = true;
                          _correctOptionId = correctOptionId;
                          _optionImageMap[optionId ?? ""] = optionImage;
                          _isLoading = false;
                        });
                      } else {
                        setState(() {
                          _isAnswered = true;
                          _correctOptionId = correctOptionId;
                          _optionImageMap[optionId ?? ""] = optionImage;
                          _optionImageMap[correctOptionId] = correctOptionImage;
                          _isLoading = false;
                        });
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
