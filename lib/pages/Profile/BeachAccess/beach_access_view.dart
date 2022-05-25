import 'package:flutter/material.dart';
import 'package:smart_city/Configurations/smart_icon_icons.dart';

class Beach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 70,
          leading:
          // IconButton(
          //   icon: Icon(
          //     SmartIcon.arrow_left,
          //   ),
          //   onPressed: () => Navigator.pop(context),
          // ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(
                SmartIcon.arrow_left,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

      ),
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/test.png'),
                    fit: BoxFit.fitWidth)),
          ),

        ],
      ),
    );
  }
}

