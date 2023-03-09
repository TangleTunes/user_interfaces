import 'package:flutter/material.dart';
import 'package:music_application/theme/theme_constants.dart';
import 'package:music_application/utils/helper_widgets.dart';

int _selectedIndex = 0;
Widget navigationBar(BuildContext context, StateSetter setState) {
  return BottomNavigationBar(
    backgroundColor: Colors.red,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'home',
        icon: Icon(
          Icons.home,
          color: COLOR_SECONDARY,
        ),
      ),
      BottomNavigationBarItem(
        label: 'search',
        icon: Icon(
          Icons.search,
          color: COLOR_SECONDARY,
        ),
      ),
      BottomNavigationBarItem(
        label: 'account',
        icon: Icon(
          Icons.account_circle,
          color: COLOR_SECONDARY,
        ),
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: COLOR_TERTIARY,
    onTap: (value) {
      setState(() {
        _selectedIndex = value;
      });
    },
  );
}
