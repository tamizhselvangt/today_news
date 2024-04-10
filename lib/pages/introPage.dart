import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'package:day_today/pages/signUpPage.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffCEFFD3),
      appBar: AppBar(backgroundColor: Color(0xffCEFFD3), title: appBarTitle()),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30),
                RichText(
                    text: TextSpan(
                      text: "Latest article",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontFamily: "PolySans"),
                    )),
                Row(
                  children: [
                    Text(
                      "with ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontFamily: "PolySans"),
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Container(
                            width: 135,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black, width: 2.3),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                        Container(
                          child: ClipRect(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "better",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "PolySans",
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                border: Border.all(color: Colors.black, width: 2.3),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ),
                          width: 135,
                          height: 60,
                        )
                      ],
                    ),
                    Text(
                      " news",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontFamily: "PolySans"),
                    ),
                  ],
                ),
                Gap(30),
                Text("Browse the best news on latest strategies, trends various tools and news in the world ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: "PolySans"
                  ),),
                Gap(30),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              color: Colors.black, width: 2.3),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    Container(
                      child: ClipRect(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                },
                                child: Text(
                                  "Get started",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "PolySans",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900
                                  ),
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                },
                               icon: Icon(
                                  color: Colors.black,
                                  Icons.arrow_forward,
                                  size: 30,
                                  weight: 30,),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(color: Colors.black, width: 2.3),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                      ),
                      width: 200,
                      height: 50,
                    )
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [

              Container(
                height: 437,
                width: 450,
                child: ClipRect(
                  child: FittedBox(
                    // clipBehavior: Clip.hardEdge,
                      fit: BoxFit.none,
                      child: Column(
                        children: [
                          Gap(550),
                          Row(
                            children: [
                              Gap(150),
                              Transform.rotate(
                                angle: math.pi / 2,
                                child: Image.asset("assets/images/toppng.com-abstract-lines-black-and-white-png-800x763.png"),
                              ),
                              // Gap(150)
                            ],
                          ),
                        ],
                      )),
                ),
              ),

              Container(
                height: 437,
                width: 450,
                child: ClipRect(
                  child: FittedBox(
                    // clipBehavior: Clip.hardEdge,
                      fit: BoxFit.none,
                      child: Column(
                        children: [
                          Gap(70),
                          Row(
                            children: [
                              Gap(160),
                              Image.asset("assets/images/pngwing.png",
                                height: 400,
                                width: 500,),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row appBarTitle() {
    return Row(
      children: [
        Image.asset(
          "assets/images/pngegg.png",
          height: 15,
          width: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              Positioned(
                bottom: 2,
                left: 0,
                right: 0,
                child: Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                left: 0,
                right: 0,
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xff73F8C3),
                  ),
                ),
              ),
              Text(
                "/hello.daytoday.blog",
                style: TextStyle(
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..color = Colors.black,
                    fontSize: 18,
                    fontFamily: 'PolySans'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
