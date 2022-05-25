import 'package:flutter/material.dart';


class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.listTile,
  }) : super(key: key);

  final Widget thumbnail;
  final Widget listTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(flex: 3, child: listTile),
        ],
      ),
    );
  }
}
