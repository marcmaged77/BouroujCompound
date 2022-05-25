import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/page_route_name.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Models/posts.dart';
import 'package:smart_city/pages/Auth/login/login_view.dart';
import 'package:smart_city/pages/Profile/BeachAccess/beach_access_view.dart';
import 'package:smart_city/pages/Profile/GateAccess/GateAccessView/gate_access_view.dart';
import 'package:smart_city/pages/Profile/IdentityBage/identity_badge_view.dart';
import 'package:smart_city/pages/Services/PendingServices/pending_services_view.dart';
import 'package:smart_city/pages/Splash/splash_view.dart';

import 'profile_viewmodel.dart';
import 'package:smart_city/Extensions/extensions.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MVVM(view: (_, __) => ProfileView(), viewModel: ProfileViewModel());
  }
}

class ProfileView extends HookView<ProfileViewModel> {
  @override
  Widget render(BuildContext context, ProfileViewModel viewModel) {
    final mediaQuery = MediaQuery/**/ .of(context);
    final textTheme = AppTheme.lightThemeData.textTheme;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: mediaQuery.size.width,
          ),
          const SizedBox(
            height: 80,
          ),
          Text('Profile', style: textTheme.headline1),
          const SizedBox(
            height: 30,
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 500),
            child: ProfileImage(
              imgUrl: postsBlog[3].imgUrl!,
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          FadeInDown(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Text(
                  'Amr Khalifa',
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Tap to Edit',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Login Details',
              subTilte: 'UserName and Password',
              leading: SmartIcon.user_edit,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {},
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Pending Services',
              subTilte: "Services in Progress",
              leading: SmartIcon.brush,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {
                pushNewScreen(
                  context,
                  screen: PendingServices(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Identity Badge',
              subTilte: "Get your Identity Information ",
              leading: Icons.card_membership_rounded,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Identity()));
              },
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Manage Gate Access',
              subTilte: "Give Access to Visitors",
              leading: Icons.door_back_door_outlined,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {
                pushNewScreen(
                  context,
                  screen: GateAccess(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                );
              },
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Manage Beach Access',
              subTilte: "Give Access to Visitors",
              leading: Icons.beach_access_outlined,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Beach()));
              },
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Legal Information',
              subTilte: 'Terms and Conditions, Privacy Policy',
              leading: SmartIcon.document_text,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {},
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 500),
            child: CustomTile(
              title: 'Help',
              subTilte: "FAQ's, HelpDesk",
              leading: SmartIcon.headphone,
              trailing: SmartIcon.arrow_right_4,
              onTap: () {},
            ),
          ),
          CustomTile(
            title: 'Log Out',
            subTilte: 'Log out from this Account',
            titleColor: Colors.red,
            trailing: SmartIcon.logout,
            color: Colors.red,
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Splash();
                  },
                ),
                (_) => false,
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ).setPageHorizontalPadding(context),
    ));
  }
}

class ProfileImage extends StatelessWidget {
  String imgUrl;
  VoidCallback onTap;

  ProfileImage({
    required this.imgUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(children: [
      Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70),
            topLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
            bottomLeft: Radius.circular(70),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 9,
            ),
          ],
          image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(70),
              topLeft: Radius.circular(30),
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
          ),
          child: Center(
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class CustomTile extends StatelessWidget {
  String title;
  Color? titleColor;
  String subTilte;
  IconData trailing;
  IconData? leading;
  Color? color;
  VoidCallback onTap;

  CustomTile({
    Key? key,
    required this.title,
    required this.subTilte,
    required this.trailing,
    required this.onTap,
    this.leading,
    this.color,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTheme.lightThemeData.textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        // border: Border.all(color: Colors.black, width: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: onTap,
          leading: leading != null
              ? Icon(
                  leading,
                  color: Colors.black,
                  size: 35,
                )
              : null,
          subtitle: Text(
            subTilte,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                color: titleColor == null ? Colors.black : titleColor),
          ),
          trailing: Icon(
            trailing,
            color: color == null ? Colors.grey : color,
          ),
        ),
      ),
    );
  }
}
