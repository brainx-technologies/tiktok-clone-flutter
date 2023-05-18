import 'package:flutter/material.dart';

class TabIcon extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;

  const TabIcon({Key? key, required this.iconData, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ColorFiltered(
            colorFilter: isSelected
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xFF67787F), BlendMode.srcIn),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
