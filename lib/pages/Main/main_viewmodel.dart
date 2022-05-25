import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/pages/Blog/blog_view.dart';
import 'package:smart_city/pages/Home/home_view.dart';
import 'package:smart_city/pages/Profile/ProfileView/profile_view.dart';
import 'package:smart_city/pages/Services/ServicesView/services_view.dart';

class MainViewModel extends ViewModel {


  late final  PersistentTabController _controller;
  PersistentTabController get  controller => _controller;


  changeScreen(int){

    _controller.index = int;
    notifyListeners();


  }

  @override
  void init() {
    // TODO: implement init
    super.init();
    _controller = PersistentTabController(initialIndex: 0);

  }





}