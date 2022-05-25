import 'package:flutter/material.dart';

class Offers {
  String name;
  String discount;
  String type;
  String date;
  Color color;
  String subtitle;
  String description;
  String imgUrl;
  String? product;

  Offers(
      {required this.name,
      required this.date,
      required this.discount,
      required this.type,
      required this.color,
      required this.subtitle,
      required this.description,
      this.product,
      required this.imgUrl});
}

String subtitle = 'A limited time';

List<Offers> offers = [
  Offers(
      name: 'Mcdonald',
      date: 'Aug 21-23',
      discount: '50',
      type: 'OFF',
      color: Color(0xffDE3310),
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/color/344/mcdonalds-app.png',
      product: 'https://img.icons8.com/emoji/344/hamburger-emoji.png'),
  Offers(
      name: 'StarBucks',
      date: 'Aug 19-23',
      discount: '10',
      type: 'Cashback',
      color: Color(0xff336E35),
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/color/344/starbucks.png',
      product: 'https://img.icons8.com/clouds/344/starbucks.png'),
  Offers(
      name: 'Amazon',
      date: 'Sep 12-15',
      discount: '30',
      type: 'OFF',
      color: Color(0xff4f6d91),
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/plasticine/344/amazon.png',
      product: 'https://img.icons8.com/officel/344/amazon.png'),
  Offers(
      name: 'Apple',
      date: 'Sep 12-15',
      discount: '40',
      type: 'CashBack',
      color: Colors.black,
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/ios-filled/452/mac-os.png',
  product: 'https://img.icons8.com/fluency/344/macbook.png'
  ),
  Offers(
      name: "Dunkin' Egypt",
      date: 'Oct 1-3',
      discount: '10',
      type: 'OFF',
      color: Color(0xffEF6C19),
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/color/344/dunkin-donuts.png',
product: 'https://img.icons8.com/clouds/344/dunkin-donuts.png'  ),
  Offers(
      name: "AirBnb",
      date: 'Oct 1-30',
      discount: '10',
      type: 'OFF',
      color: Color(0xffFF5252),
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/color/344/airbnb.png',
  product: 'https://img.icons8.com/fluency/344/sell-property.png'
  ),
  Offers(
      name: "BurgerKing",
      date: 'Dec 1-3',
      discount: '20',
      type: 'OFF',
      color: Color(0xffFEBF27),
      subtitle: '',
      description: '',
      imgUrl: 'https://img.icons8.com/color/344/burger-king-logo.png',
      product: 'https://img.icons8.com/emoji/344/hamburger-emoji.png'),
  Offers(
      name: 'Costa Coffee',
      date: 'Oct 1-3',
      discount: '100',
      type: 'CashBack',
      color: Color(0xff8C1D31),
      subtitle: '',
      description: '',
      imgUrl:
          'https://e7.pngegg.com/pngimages/628/855/png-clipart-costa-coffee-cafe-cappuccino-barista-dr-clothing-food-text.png',
  product: 'https://img.icons8.com/fluency/344/iced-coffee.png'
  ),
];
