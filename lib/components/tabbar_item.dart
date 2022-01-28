import 'package:flutter/material.dart';

class TabBarItem extends BottomNavigationBarItem {
  TabBarItem(String iconName, String label):
    super(
      icon: Image.asset("assets/images/tab_${iconName}_normal.png", width:30), 
      activeIcon: Image.asset("assets/images/tab_${iconName}_active.png", width:30), 
      label: "$label"
    );
}