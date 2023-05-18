import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/data/provider/question_provider.dart';
import 'package:tiktok_clone/global/app_colors.dart';
import 'package:tiktok_clone/global/app_constants.dart';

import 'data/provider/flash_card_provider.dart';
import 'features/main/main_page.dart';
import 'global/utils.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void initializeScreenSize(BuildContext context) {
    Utils.screenHeight = MediaQuery.of(context).size.height;
    Utils.screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    Size designSize = calculateDesignSize(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashcardProvider()),
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appTitle,
        theme: ThemeData(
          fontFamily: 'SFProRounded',
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.daintree,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.4),
          ),
        ),
        home: ScreenUtilInit(
          designSize: designSize,
          builder: (context, _) {
            return const MainPage(title: AppConstants.appTitle);
          },
        ),
      ),
    );
  }

  Size calculateDesignSize(BuildContext context) {
    double designHeight = 812;
    double designWidth =
        Utils.screenHeight / Utils.screenWidth < 1.6 ? 480.0 : 375.0;
    return Size(designWidth, designHeight);
  }
}
