import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noti/views/collections.dart';
import 'package:noti/views/explore/explore.dart';
import 'package:noti/views/settings.dart';

import '../views/feeds/feeds.dart';

class DashboardProvider extends ChangeNotifier{
  final List<Widget> _screens = <Widget>[
    Feeds(),
    Explore(),
    Collections(),
    Settings()

  ];

  int _screenIndex = 0;

  get getScreens => _screens;

  get getScreenIndex => _screenIndex;

  setScreenIndex (int index){
    _screenIndex = index;
    notifyListeners();
  }

}