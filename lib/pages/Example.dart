import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Color(0xff0c7c0fa),
        height: 530,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15,20,10,0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.5,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 14,
                        decoration: BoxDecoration(
                          color: Color(0xff99f4c6),
                        ),
                      ),
                    ),
                    Text(
                      "HEADLINE",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                          fontFamily: 'Mono sans'
                      ),
                    ),
                  ],
                ),
              ),
              articlePreviewTitle(),
             SizedBox(
               height: 10,
             ),
              previewPoster(),
              SizedBox(height: 20,),
              articlePrevieDescription(),
              SizedBox(height: 30,),
              articleBottomIcons(),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.black26,
                thickness: 1,
                height: 10,
              )
            ],
          ),
        ),
      )
    );
  }
}

Widget articlePrevieDescription(){
  return RichText(
    text: TextSpan(
      text: 'We designed a news portal application, and we tried to come up with a unique theme. Unlike digital platforms, we kept the theme of physical ',
      style: TextStyle(color: Colors.black),
      children: [
        TextSpan(
          text: '...world!',
          style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget articleBottomIcons(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(Icons.favorite_border_outlined,
          size: 30,),

          SizedBox(width: 30,),
          Icon(Icons.volume_up_outlined,size: 30,),
        ],
      ),
      Row(
        children: [
          Icon(Icons.access_time),

          Text(" 17 houres ago",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black45
          ),)
        ],
      )
    ],
  );
}

Widget articlePreviewTitle(){
  return Text(" -Biden vows to codify Roe \"We Gotta Vote\"",
  style: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    fontFamily: 'Mono sans'
  ),);
}

Widget previewPoster(){
  return
    Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 15,10,0),
          child: Container(
            width: 400,
            height: 225,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.3),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 20,0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.network("https://d30ny7ijak9wq4.cloudfront.net/s3fs-public/images/movie_image/2024/04/01/-10.jpg"),
          ),
        ),
        Positioned(
           left: 310,
            top: 190,
            child: Icon(Icons.camera_alt_outlined,
            size: 30,
            color: Colors.white70,)
        )
      ],
    );
}


