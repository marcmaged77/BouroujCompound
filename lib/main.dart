import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/constants.dart';

import 'Configurations/color.dart';
import 'Configurations/page_route_name.dart';
import 'Configurations/routes.dart';
import 'Services/loading_service.dart';
import 'pages/Auth/login/login_view.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() {
  runApp(MyApp());
  configLoading();

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      initialRoute: PageRouteName.initial,
      onGenerateRoute: Routes.generateRoute,
      builder: EasyLoading.init(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 0.85, ),
          child: child ?? const Scaffold(),
        ),
      ),



      title: Constants.appName,
      theme: AppTheme.lightThemeData
      
      // ThemeData(
      //     // fontFamily: GoogleFonts.aBeeZee().fontFamily,
      //     fontFamily: GoogleFonts.poppins().fontFamily,
      //     // fontFamily: 'Gilroyas',
      //
      //
      //     // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   // primarySwatch: Colors.blue,
      //   primaryColor: Color(0xff112C47),
      //   buttonColor: Color(0xffBA932E),
      //   indicatorColor: const Color(0xff112C47),
      //   scaffoldBackgroundColor: const Color(0xffF7F7F7),
      //
      //   textTheme: TextTheme(
      //     headline1:const TextStyle(
      //       fontSize: 24,
      //       color: AppColors.black,
      //       fontWeight: FontWeight.w700,
      //       fontStyle: FontStyle.normal,),
      //   )
      //
      //
      //
      //
      // ),
    );
  }
}


