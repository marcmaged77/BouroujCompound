import 'package:flutter/material.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';

import 'package:smart_city/Extensions/extensions.dart';
import 'package:smart_city/Models/posts.dart';
import 'package:smart_city/widgets/ticket_widget.dart';

// import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class Identity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery/**/ .of(context);
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Identity Badge', style: theme.textTheme.headline1,),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
          color: theme.primaryColor,
          icon: Icon(SmartIcon.arrow_left_1, size: 30,),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50,),

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
                height: 500.0,
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
                              Text('Owner', style: TextStyle(color: Colors.grey),),
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
                              Text('Unit',style:TextStyle(color: Colors.grey)),
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
                              Text('Building',style :TextStyle(color: Colors.grey)),
                              Text('6'),
                            ],
                          ),
                        ],
                      ),
SizedBox(height: 45,),
                      DottedLine(),
                      SizedBox(height: 30,),

                      SizedBox(
                          height: 150,
                          child: Image.asset('assets/images/qrCode.png')),

                      TextButton(onPressed: (){}, child: Text('Refresh'))
                      // MaterialButton(
                      //   onPressed: () {},
                      //   height: 45,
                      //   color: Color(0xff112C47),
                      //   child: Text(
                      //     "Refresh",
                      //     style: TextStyle(color: Colors.white, fontSize: 16.0),
                      //   ),
                      //   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //   ),
                      // ),




                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Text('please Note That you cant share a Screen Shot from this page, Please Do Not Share this Qr Code With AnyOne Except the gate Keepers', style: TextStyle(color: Colors.grey),)
        ],
      ).setPageHorizontalPadding(context),
    );
  }
}
