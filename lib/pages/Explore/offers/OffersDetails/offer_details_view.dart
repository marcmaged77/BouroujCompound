import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';
import 'package:smart_city/Models/offers.dart';
import 'package:smart_city/Extensions/extensions.dart';

class OfferDetail extends StatelessWidget {
  Offers offer;

  OfferDetail({required this.offer});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:FadeInUp(
        delay: Duration(milliseconds: 400),
        child: MaterialButton(
          onPressed: () {},
          height: 45,
          color: offer.color,
          child: Text(
            "Claim",
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 120),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      backgroundColor: offer.color,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(
            SmartIcon.arrow_left_1,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: mediaQuery.size.height * 0.23,
              // color: Colors.red,
              width: mediaQuery.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.discount + '%',
                            style: TextStyle(
                                color: Colors.white, fontSize: 100, height: 1),
                            softWrap: true,
                          ),
                          Text(
                            offer.type,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            offer.date,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Image.network(
                        offer.product!,
                        scale: 2.5,
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      '* Terms & condition applied',
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    )
                  ])
                ],
              ).setPageHorizontalPadding(context),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: mediaQuery.size.height * 0.66,
              width: mediaQuery.size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "What's inside ?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'A limited time ${offer.discount}% Cashback on every product you buy from ${offer.name} with put barcode that we provide.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'How to redeem ?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- Click the claim to button to generate a one time barcode. \n- go to the merchant and show it to them. \n- you have on 72 hours once you claim your offer',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ],
              ).setPageHorizontalPadding(context),
            ),
          ],
        ),
      ),
    );
  }
}
