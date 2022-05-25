import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/pages/Blog/blog_view.dart';
import 'package:smart_city/pages/Explore/eplore_view.dart';
import 'package:smart_city/pages/Home/home_view.dart';
import 'package:smart_city/pages/Profile/ProfileView/profile_view.dart';
import 'package:smart_city/pages/Services/ServicesView/services_view.dart';

import 'main_viewmodel.dart';

// MainViewModel

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => Main(),
      viewModel: MainViewModel(),
    );
  }
}

class Main extends HookView<MainViewModel> {
  @override
  Widget render(BuildContext context, MainViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    // final theme = Theme.of(context);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: Colors.grey,
          title: "Home",
          inactiveIcon: Icon(Iconsax.home),
          icon: Icon(Iconsax.home_15),
        ),
        PersistentBottomNavBarItem(
            // activeColorPrimary: Colors.white,
            inactiveColorPrimary: Colors.grey,
            activeColorPrimary: AppColors.primaryColor,
            title: 'Community',
            // icon: Icon(Iconsax.people),
            icon: Icon(Iconsax.people5),
            inactiveIcon: Icon(Iconsax.people)),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.primaryColor,

          // activeColorPrimary: Colors.white,
          // inactiveColorPrimary: Colors.grey,
          title: 'Explore',
          // inactiveIcon: Icon(Icons.explore_outlined, color: Colors.white,),
          icon: Icon(SmartIcon.activity_bold, color: AppColors.primaryColor),
          inactiveIcon: Icon(SmartIcon.activity, color: Colors.grey),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.primaryColor,

          // activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.grey,
          // textStyle: TextStyle(fontWeight: FontWeight.w500),
          title: 'Services',
          // inactiveIcon:Icon(Icons.settings_remote_outlined),
          icon: Icon(SmartIcon.brush),
          // inactiveIcon:Icon(SmartIcon.house),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: AppColors.primaryColor,

          // activeColorPrimary: Colors.white,
          // inactiveIcon: Icon(Iconsax.profile_circle4),
          // inactiveIcon:  Icon( Iconsax.user),
          // inactiveIcon: Icon(Icons.account_circle_outlined),

          inactiveColorPrimary: Colors.grey,
          title: 'Profile',
          // icon: Icon(Icons.account_circle_rounded),
          icon: Icon(SmartIcon.user),
        ),
      ];
    }

    List<Widget> buildScreens() {
      return [
        Home(
          mainViewModel: viewModel,
        ),
        Blog(),
        Explore(),
        Service(),
        Profile()
      ];
    }

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: viewModel.controller,
        screens: buildScreens(),
        items: _navBarsItems(),
        // hideNavigationBar: false,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          // colorBehindNavBar: ,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 100),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 100),
        ),
        navBarStyle:
            NavBarStyle.style12, // Choose the nav bar style with this property.
      ),
    );
  }
}
