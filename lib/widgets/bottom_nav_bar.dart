import 'package:flutter/material.dart';
import 'package:tiktok_clone/global/app_text_styles.dart';
import 'package:tiktok_clone/features/main/widget/tab_icon.dart';
import 'package:tiktok_clone/global/app_constants.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int>? onIndexChanged;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    this.onIndexChanged,
  });

  final int currentIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: CustomTextStyles.selectedLabelStyle,
      unselectedLabelStyle: CustomTextStyles.unselectedLabelStyle,
      currentIndex: widget.currentIndex,
      onTap: (int index) {
        setState(() {
          widget.onIndexChanged?.call(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: TabIcon(
            iconData: Icons.home,
            isSelected: widget.currentIndex == 0,
          ),
          label: AppConstants.home,
        ),
        BottomNavigationBarItem(
          icon: TabIcon(
            iconData: Icons.search,
            isSelected: widget.currentIndex == 1,
          ),
          label: AppConstants.discover,
        ),
        BottomNavigationBarItem(
          icon: TabIcon(
            iconData: Icons.notifications,
            isSelected: widget.currentIndex == 2,
          ),
          label: AppConstants.activity,
        ),
        BottomNavigationBarItem(
          icon: TabIcon(
            iconData: Icons.message,
            isSelected: widget.currentIndex == 3,
          ),
          label: AppConstants.bookmarks,
        ),
        BottomNavigationBarItem(
          icon: TabIcon(
            iconData: Icons.person,
            isSelected: widget.currentIndex == 4,
          ),
          label: AppConstants.profile,
        ),
      ],
    );
  }
}
