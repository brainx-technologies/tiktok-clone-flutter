import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/global/app_constants.dart';
import 'package:tiktok_clone/global/app_text_styles.dart';
import 'package:tiktok_clone/global/images.dart';
import 'package:tiktok_clone/widgets/elapsed_time_widget.dart';
import 'package:tiktok_clone/features/following/following_page.dart';
import 'package:tiktok_clone/features/foryou/for_you_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  late Timer _timer;
  Duration _elapsedTime = Duration.zero;
  String _elapsedTimeString = '';

  @override
  void initState() {
    super.initState();
    _elapsedTime = const Duration();
    _elapsedTimeString = _formatDuration(_elapsedTime);
    _timer = Timer.periodic(const Duration(seconds: 1), _updateElapsedTime);
  }

  void _updateElapsedTime(Timer timer) {
    setState(() {
      _elapsedTime += const Duration(seconds: 1);
      _elapsedTimeString = _formatDuration(_elapsedTime);
    });
  }

  String _formatDuration(Duration duration) {
    return '${(duration.inMinutes % 60).toString().padLeft(1, '0')}m ';
  }

  @override
  void dispose() {
    _timer.cancel();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ElapsedTimeWidget(),
              Center(
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0, color: Colors.white),
                    insets: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                  ),
                  labelStyle: CustomTextStyles.selectedTabTextStyle,
                  unselectedLabelStyle: CustomTextStyles.unselectedTabTextStyle,
                  isScrollable: true,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  tabs: const [
                    Tab(text: AppConstants.following),
                    Tab(text: AppConstants.forYou),
                  ],
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
                child: Image(
                  image: AssetImage(Images.search),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: const [
              FollowingPage(),
              ForYouPage(),
            ],
          ),
        ),
      ],
    );
  }
}
