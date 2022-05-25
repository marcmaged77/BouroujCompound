import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/Models/offers.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smart_city/pages/Explore/offers/OffersDetails/offer_details_view.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Offers',
            style: theme.textTheme.headline1,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: theme.primaryColor,
            icon: Icon(SmartIcon.arrow_left_1, size: 30,color: Colors.black,),

            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.only(bottom: 30),
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                itemCount: offers.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){
                      pushNewScreen(
                        context,
                        screen: OfferDetail(offer: offers[index]),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.fade,
                      );

                    },

                    child: OffersContainer(
                      type: offers[index].type,
                      imgUrl: offers[index].imgUrl,
                      name: offers[index].name,
                      date: offers[index].date,
                      discount: offers[index].discount,
                    ),
                  );
                },
              ),
            ),
            // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
            SizedBox(
              height: 10,
            ),
          ],
        ).setPageHorizontalPadding(context));
  }
}

class OffersContainer extends StatelessWidget {
  String discount;
  String type;
  String name;
  String date;
  String imgUrl;

  OffersContainer({
    required this.date,
    required this.name,
    required this.type,
    required this.imgUrl,
    required this.discount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: Container(
        padding: const EdgeInsets.all(10),
        // height: 160,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: NetworkImage(imgUrl))),
            ),
            Text(
              '${discount}%  ${type}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 13, color: Colors.blueAccent),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  date,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
