import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/features/foryou/for_you_page_question.dart';

import 'package:tiktok_clone/data/provider/question_provider.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  ForYouPageState createState() => ForYouPageState();
}

class ForYouPageState extends State<ForYouPage> {
  bool isLiked = false;
  PageController pageController = PageController();
  List<Widget> forYouContent = [];

  @override
  void initState() {
    super.initState();
    Provider.of<QuestionProvider>(context, listen: false)
        .fetchQuestion()
        .then((_) {
      final questions =
          Provider.of<QuestionProvider>(context, listen: false).question;
      for (int i = 0; i < 10; i++) {
        forYouContent.add(ForYouPageQuestion(
          data: questions,
        ));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: forYouContent.isEmpty
          ? <Widget>[
              Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ]
          : forYouContent,
    );
  }
}
