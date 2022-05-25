import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/page_route_name.dart';
import 'package:smart_city/pages/Auth/login/login_view.dart';

import '../../Configurations/constants.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  checkLoginState() async {
    // await Auth.initializeBillingProfileId();
    await Future.delayed(const Duration(milliseconds: 2000));

    // print(Auth.token);
    // if( Auth.token !=null ){
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   Auth().user.userName = pref.getString('userName');
    //
    //
    Navigator.pushReplacement(
        context, PageTransition(type: PageTransitionType.fade, child: Login())
        // PageRouteName.login
        );
    // Navigator.of(context).pushReplacementNamed(PageRouteName.login);
    // }else{
    //   Navigator.of(context).pushReplacementNamed(PageRouteName.login);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: FadeInUpBig(
          child: SizedBox(
            height: 350,
            child: Hero(
                tag: 'logo',
                // child:  Image.asset('assets/logo/hassan_logo_00022.png')
                child:  Image.asset(Constants.logoUrl, scale: 11,)

            ),
          ),
        ),
      ),
    );
  }
}
