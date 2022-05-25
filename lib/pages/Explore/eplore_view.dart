import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_city/Configurations/color.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';

import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/Models/posts.dart';
import 'package:smart_city/pages/Explore/offers/OffersView/offers_view.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Where do',
                        style: TextStyle(
                          fontSize: 25,
                          // color: theme.primaryColor,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'You want to go?',
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // _imageContainerProfile(imgUrl: postsBlog[3].imgUrl!),
                  IconButton(
                    icon: Icon(
                      SmartIcon.bag_2,
                      size: 40,
                      color: AppColors.black400,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: CupertinoSearchTextField(
                  prefixIcon: Icon(SmartIcon.search_normal),
                  placeholder: 'Discover city',
                  padding: const EdgeInsets.all(15),
                ),
              ),
              Text(
                'Explore City',
                style: theme.textTheme.headline1
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                      icon: Text(
                    'Restaurants',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )),
                  Tab(
                      icon: Text(
                    'Sports Club',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  )),
                  Tab(
                      icon: Text(
                    'Store',
                    style: TextStyle(color: Colors.black,  fontSize: 17),
                  )),
                  Tab(
                      icon: Text(
                    'Real State',
                    style: TextStyle(color:Colors.black,  fontSize: 17),
                  )),
                  Tab(
                      icon: Text(
                    'Transportation',
                    style: TextStyle(color: Colors.black,  fontSize: 17),
                  )),
                ],
              ),
              SizedBox(
                height: 200,
                child: TabBarView(children: [
                  ListView.separated(
                      padding: EdgeInsets.only(top: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 140,
                          color: Colors.blue,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 7),
                  ListView.separated(
                      padding: EdgeInsets.only(top: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 140,
                          color: Colors.blue,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 7),
                  ListView.separated(
                      padding: EdgeInsets.only(top: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 140,
                          color: Colors.blue,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 7),
                  ListView.separated(
                      padding: EdgeInsets.only(top: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 140,
                          color: Colors.blue,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 7),
                  ListView.separated(
                      padding: EdgeInsets.only(top: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.4)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 140,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: 7),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Offers',
                    style: theme.textTheme.headline1
                        ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Offers()));


                      },
                      child: Text(
                        'See All',
                        style:
                            TextStyle(color: Colors.black54, fontSize: 14),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              OfferContainer(
                percent: '40',
                subtitle: 'HandMade freshly ground \n coffee',
                imgUrl: 'assets/images/coffee.png',
              ),

            ],
          ).setPageHorizontalPadding(context),
        ),
      ),
    );
  }
}

class OfferContainer extends StatelessWidget {
  OfferContainer({
    Key? key,
     this.imgUrl,
     this.imgUrlNetwork,
    required this.percent,
    required this.subtitle,
  }) : super(key: key);

  String? imgUrl;
  String? imgUrlNetwork;
  String percent;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Stack(
        children: [
          Container(
            height: 100,
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
          ),
          Positioned(
            right: 10,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
            ),
          ),
          InkWell(
            onTap: () {
              print('offer');
            },
            child: Container(
              padding: EdgeInsets.all(4),
              height: 100,
              width: mediaQuery.size.width,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                image:imgUrl != null ?  DecorationImage(
                    image:AssetImage(imgUrl!)  , fit: BoxFit.cover) : DecorationImage(
                    image:AssetImage(imgUrlNetwork!)  , fit: BoxFit.contain)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$percent% ',
                    style: GoogleFonts.actor(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
