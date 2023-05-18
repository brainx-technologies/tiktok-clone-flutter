import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tiktok_clone/global/app_colors.dart';
import 'following_page_main.dart';
import 'package:tiktok_clone/data/models/flash_cards.dart';
import 'package:tiktok_clone/data/provider/flash_card_provider.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  FollowingPageState createState() => FollowingPageState();
}

class FollowingPageState extends State<FollowingPage> {
  bool isLiked = false;
  PageController pageController = PageController();
  List<Widget> followingContent = [];

  @override
  void initState() {
    super.initState();
    Provider.of<FlashcardProvider>(context, listen: false)
        .getFlashcards()
        .then((_) {
      final flashcards =
          Provider.of<FlashcardProvider>(context, listen: false).flashcards;
      for (int i = 0; i < 10; i++) {
        var flashcard = flashcards[0];
        var card = Flashcard(
          type: "",
          id: flashcard.id,
          flashcardFront: flashcard.flashcardFront,
          flashcardBack: flashcard.flashcardBack,
          playlist: flashcard.playlist,
          user: flashcard.user,
          description: flashcard.description,
        );
        followingContent.add(FollowingPageMain(
          data: card,
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
      children: followingContent.isEmpty
          ? <Widget>[
              Container(
                color: AppColors.daintree,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ]
          : followingContent,
    );
  }
}
