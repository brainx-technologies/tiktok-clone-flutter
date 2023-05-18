import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/global/app_colors.dart';
import 'package:tiktok_clone/global/app_constants.dart';
import 'package:tiktok_clone/global/images.dart';
import 'package:tiktok_clone/widgets/bottom_nav_bar.dart';
import 'package:tiktok_clone/global/utils.dart';
import 'package:tiktok_clone/features/home/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.daintree,
    ));
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
          onIndexChanged: handleIndexChanged,
        ),
        body: Container(
          height: Utils.screenHeight,
          width: Utils.screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.background),
              fit: BoxFit.cover,
            ),
          ),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: currentIndex,
      children: const [
        HomeScreen(),
        Center(child: Text(AppConstants.screen2)),
        Center(child: Text(AppConstants.screen3)),
        Center(child: Text(AppConstants.screen4)),
        Center(child: Text(AppConstants.screen5)),
      ],
    );
  }

  void handleIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
