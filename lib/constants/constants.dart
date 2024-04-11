import 'package:flutter/material.dart';

var kTopBarTitle = const TextStyle(
    fontSize: 20,
    color: Colors.black38,
    fontWeight: FontWeight.w700,
    fontFamily: "PolySans");


double kHeight(context) => MediaQuery.of(context).size.height;
double kWidth(context) => MediaQuery.of(context).size.width;


var kTopBarSelectedTitle = const TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    fontFamily: "PolySans");

var kNewsArticleTitle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontSize: 32,
    letterSpacing: 0,
    height: 0,
    fontFamily: 'PolySans');

var kImages = [
  "https://i.insider.com/65ef0d90ce7f1785b2e86738?width=1200&format=jpeg",
  "https://media.wired.com/photos/63f921f9d35154c5a172800e/191:100/w_2580,c_limit/PSVR2-Review-Headset-Gear.jpg",
  "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/e911b2a85334485e5247978dc8a34b5e.jpg"
];

var kSideMenuTitleStyle = const TextStyle(
    fontSize: 23, fontFamily: "PolySans",color: Colors.black87, fontWeight: FontWeight.w500);
