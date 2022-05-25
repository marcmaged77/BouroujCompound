import 'package:flutter/material.dart';


class HomeCommunityContainer extends StatelessWidget {
  String caption;
  String name;
  String timeAgo;

  HomeCommunityContainer({
    Key? key,
    required this.caption,
    required this.name,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 48),
        padding: EdgeInsets.all(20),

        // height: 300,
        width: mediaQuery.size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.2,
              blurRadius: 9,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100),
            topLeft: Radius.circular(100),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              '@${name}',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              caption,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                timeAgo,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 10, color: Colors.grey),
              )
            ]),
          ],
        ),
      ),
      Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            child: CircleAvatar(
              radius: 44.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.2),
                radius: 38.0,
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 70,
                  color: Colors.grey,
                ),
              ),
            ),
          )),
    ]);
  }
}
