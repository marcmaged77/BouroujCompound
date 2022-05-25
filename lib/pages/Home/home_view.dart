import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pmvvm/pmvvm.dart';
import 'package:smart_city/Configurations/appTheme.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/Models/posts.dart';
import 'package:smart_city/Models/services.dart';
import 'package:smart_city/pages/Main/main_viewmodel.dart';
import 'package:smart_city/pages/Profile/GateAccess/GateAccessView/gate_access_view.dart';
import 'package:smart_city/pages/Services/PendingServices/pending_services_view.dart';
import 'package:smart_city/widgets/ticket_widget.dart';
import 'home_viewmodel.dart';
import 'package:smart_city/widgets/widgets.dart';

class Home extends StatelessWidget {
  MainViewModel? mainViewModel;

  Home({Key? key, this.mainViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      view: (_, __) => HomeView(),
      viewModel: HomeViewModel(mainViewModel: mainViewModel!),
    );
  }
}

class HomeView extends HookView<HomeViewModel> {
  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    final mediaQuery = MediaQuery.of(context);
    final textTheme = AppTheme.lightThemeData.textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _imageContainerProfile(imgUrl: postsBlog[3].imgUrl!),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome,',
                            style: textTheme.caption?.copyWith(fontSize: 20),
                          ),
                          Text(
                            'Amr Khalifa',
                            style: textTheme.headline1?.copyWith(fontSize: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        SmartIcon.notification_bing,
                        color: Colors.black,
                        size: 30,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              /// Weather Container
              HomeWeatherContainer(
                degree: '30°',
                weatherCondition: 'Sunny Day',
              ),
              const SizedBox(
                height: 20,
              ),

              ///Weather End -------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Actions',
                    style: textTheme.headline1
                        ?.copyWith(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _quickAction(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: GateAccess(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    title: 'Gate Access',
                    imgUrl:
                        'https://img.icons8.com/external-flatart-icons-lineal-color-flatarticons/344/external-gate-city-elements-flatart-icons-lineal-color-flatarticons.png',
                  ),
                  _quickAction(
                    onTap: () {},
                    title: 'Beach Access',
                    imgUrl:
                        'https://img.icons8.com/external-photo3ideastudio-flat-photo3ideastudio/344/external-beach-chair-summer-time-photo3ideastudio-flat-photo3ideastudio.png',
                  ),
                  _quickAction(
                    onTap: () {
                      pushNewScreen(
                        context,
                        screen: PendingServices(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );
                    },
                    title: 'Pending Services',
                    scale: 10,
                    imgUrl:
                        'https://img.icons8.com/color-glass/452/services.png',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _quickAction(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 6,
                                sigmaY: 6,
                              ),
                              child: FadeInUp(
                                duration: Duration(milliseconds: 500),
                                child:
                                    IdentityBadgeDialog(mediaQuery: mediaQuery),
                              ),
                            );
                          });
                    },
                    title: 'Identity Badge',
                    imgUrl: 'https://img.icons8.com/fluency/344/badge.png',
                  ),
                  _quickAction(
                    onTap: () {},
                    title: 'More',
                    imgUrl: 'https://img.icons8.com/ios/344/add--v1.png',
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              /// Services Container

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Services',
                    style: textTheme.headline1
                        ?.copyWith(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.changePage(3);
                    },
                    child: Text(
                      'See More',
                      style: textTheme.headline1?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInLeft(
                child: Container(
                  height: 115,
                  width: mediaQuery.size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return FadeInDown(
                        delay: Duration(milliseconds: index * 10),
                        duration: Duration(milliseconds: (index + 1) * 80),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: HomeServiceContainer(
                              name: services[index].name,
                              imgURL: services[index].imageURL,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              ///Services End -------------------

              const SizedBox(
                height: 20,
              ),

              /// Community Container

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Community',
                    style: textTheme.headline1
                        ?.copyWith(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {
                      viewModel.changePage(1);
                    },
                    child: Text(
                      'See More',
                      style: textTheme.headline1?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.black54),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 15,
              // ),
              ListView.separated(
                // scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(bottom: 40),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: postsBlog.length > 9 ? 2 : postsBlog.length,
                itemBuilder: (context, index) {
                  return FadeInUp(
                      delay: Duration(milliseconds: index * 10),
                      duration: Duration(milliseconds: (index + 1) * 80),
                      child: HomeCommunityContainer(
                        caption: postsBlog[index].caption!,
                        timeAgo: postsBlog[index].timeAgo!,
                        name: postsBlog[index].name!,
                      ));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ),

              ///Community End -------------------

              const SizedBox(
                height: 20,
              ),
            ],
          ).setPageHorizontalPadding(context),
        ),
      ),
    );
  }
}

class IdentityBadgeDialog extends StatelessWidget {
  const IdentityBadgeDialog({
    Key? key,
    required this.mediaQuery,
  }) : super(key: key);

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 9,
                ),
              ],
            ),
            child: FlutterTicketWidget(
              width: mediaQuery.size.width,
              height: 600.0,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    SizedBox(
                        height: 150,
                        child: Image.asset('assets/logo/hassan_logo.jpg')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 9,
                              ),
                            ],
                            image: DecorationImage(
                                image: AssetImage(postsBlog[7].imgUrl!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Owner',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text('Amr Khalifa'),
                          ],
                        ),
                        SizedBox(
                            height: 30,
                            child: DottedLine(
                              direction: Axis.vertical,
                            )),
                        Column(
                          children: [
                            Text('Unit', style: TextStyle(color: Colors.grey)),
                            Text('C80BG'),
                          ],
                        ),
                        SizedBox(
                            height: 30,
                            child: DottedLine(
                              direction: Axis.vertical,
                            )),
                        Column(
                          children: [
                            Text('Building',
                                style: TextStyle(color: Colors.grey)),
                            Text('6'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const DottedLine(),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        height: 200,
                        child: Image.asset('assets/images/qrCode.png')),
                    TextButton(onPressed: () {}, child: Text('Refresh'))
                  ],
                ),
              ),
            ),
          ),
        ).setPageHorizontalPadding(context),
        const SizedBox(
          height: 40,
        ),
        CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff2C3333),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.white,
                )))
      ],
    );
  }
}

class HomeServiceContainer extends StatelessWidget {
  String imgURL;
  String name;

  HomeServiceContainer({Key? key, required this.imgURL, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.all(10),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.shade300.withOpacity(0.4),
            // Colors.white
            // Colors.grey.shade300.withOpacity(0.3),
          ),
          child: Center(
              child: Image.network(
            imgURL,
            scale: 3,
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.black45, fontSize: 14),
        ),
      ],
    );
  }
}

class HomeWeatherContainer extends StatelessWidget {
  String degree;
  String weatherCondition;

  HomeWeatherContainer({
    Key? key,
    required this.degree,
    required this.weatherCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(15),
      // height: 180,
      width: mediaQuery.size.width * 0.6,
      decoration: BoxDecoration(
        color: Color(0xff5873fe),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child:
          Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                top: -40,
                right: -150,
                child: FadeInRight(
                  child: Container(
                    decoration: BoxDecoration(
                      shape:BoxShape.circle ,
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: Colors.white.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                      height: 200,
                      child: Image.asset('assets/images/cloudyDay.png')),
                ),
              ),
              FadeInLeft(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        degree,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 50),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        weatherCondition,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      )
                    ],
                  ),
                ],
        ),
        Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 130,
                    ),
                  Text(
                    'Tomorrow 25°/27°',
                    style: TextStyle(color: Colors.white),
                  )
                ],
        ),
      ]),
              ),

            ],
          ),
    );
  }
}

class _quickAction extends StatelessWidget {
  const _quickAction({
    Key? key,
    required this.title,
    required this.imgUrl,
    required this.onTap,
    this.scale,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final double? scale;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          height: 110,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
                width: 0.7,
                color: Colors.black.withOpacity(0.2).withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 9,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Image.network(
                imgUrl,
                scale: scale == null ? 7 : scale!,
              ),
              // Icon(icon, size: 40,color: theme.primaryColor,),
              Text(
                title,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _imageContainerProfile extends StatelessWidget {
  String imgUrl;

  _imageContainerProfile({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 9,
          ),
        ],
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
      ),
    );
  }
}
