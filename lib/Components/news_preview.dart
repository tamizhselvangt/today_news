import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:today_news/utilities/fetchNews.dart';
import "package:today_news/constants/constants.dart";
import 'package:http/http.dart' as http;



Widget articlePreviewCard(){
  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
          Container(
            height: 50,
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.3, color: Colors.black54),
                  bottom: BorderSide(width: 0.2, color: Colors.black),
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("HOME",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                    fontFamily: "bronice-bold"
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("TECH",
                  style: kTopBarTitles,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("POLITICS",
                  style: kTopBarTitles,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("CRYPTO",
                  style: kTopBarTitles,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("MARKET",
                  style: kTopBarTitles,),
                )
              ],
            ),
          ),
      ),
      Container(
        height: 600,
        child: FutureBuilder<List<NewsArticle>>(
          future: fetchNewsArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<NewsArticle>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                  final article = snapshot.data![index];
                  if (article.description == null || article.description!.isEmpty) return Container();
                  if (article.urlToImage == null || article.description!.isEmpty) return Container();
                   return Container(
                     decoration: BoxDecoration(
                       border: Border(
                         top: BorderSide(width: 0.3, color: Colors.black54),
                         bottom: BorderSide(width: 0.2, color: Colors.black),
                       )
                   ),
                     child: Container(
                        color: Color(0xffc8ebfd),
                        height: 590,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15,20,10,0),
                          child: Column(
                            children: [
                              Headline(),
                              SizedBox(height: 10,),
                              articlePreviewTitle(article.title!),
                              SizedBox(height: 10,),
                              previewPoster(article.urlToImage!),
                              SizedBox(height: 10,),
                              articlePrevieDescription(article.description!),
                              SizedBox(height: 20,),
                              articleBottomIcons(),
                            ],
                          ),
                        ),
                      ),
                   );
                  },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    ],
  );
}

class Headline extends StatelessWidget {

  Widget build(BuildContext context) {
    return Align(
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
              height: 15,
              decoration: BoxDecoration(
                color: Color(0xfff3e386),
              ),
            ),
          ),
          Text(
            "HEADLINE",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Mono sans'
            ),
          ),
        ],
      ),
    );
  }
}

Widget articlePreviewTitle(String title){
  final desc = title.replaceAll("'", "\'").replaceAll(RegExp(r'[\u2018\u2019\u201C\u201D]'), "\'");
  final words = desc.split(' ');
  final first10Words = words.take(10).join(' ');
  return RichText(
    text: TextSpan(
      text: "—",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 25,
        letterSpacing: 0
      ),
      children: [
        TextSpan(
          text: "${first10Words}",
          style:TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 28,
              fontFamily: 'LibreBaskerville-Regular'
          ),
        ),
        TextSpan(
          text: "...",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'LibreBaskerville-Regular'
          ),
        )
      ]
  ),
  );
}

Widget articlePrevieDescription(String description){
  final desc = description.replaceAll(RegExp(r'[\u2018\u2019\u201C\u201D]'), "\'");
  final words = desc.split(' ');
  final first20Words = words.take(20).join(' ');
  return Container(
    height: 70,
    child: RichText(
      text: TextSpan(
        text: "${first20Words}",
        style: TextStyle(
          color: Colors.black87,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,),
        children: [
          TextSpan(
            text: '...',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold
            ),
          ),
          TextSpan(
            text: 'More',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 18,
                fontFamily: "LibreBaskerville-Regular",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget articleBottomIcons(){
  return Container(
    height: 20,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.favorite_border_outlined,
              size: 25,),
            SizedBox(width: 30,),
            Icon(Icons.volume_up_outlined,size: 25,),
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
    ),
  );
}


Widget previewPoster(String url){


  Future<int> getImageStatusCode(String ur) async {
     final response = await http.head(Uri.parse(ur));
      return response.statusCode;
  }
  var image = ColorFiltered(
    colorFilter: ColorFilter.matrix(<double>[
      0.2126,0.7152,0.0722,0,0,
      0.2126,0.7152,0.0722,0,0,
      0.2126,0.7152,0.0722,0,0,
      0,0,0,1,0,
    ]),
    child: getImageStatusCode(url) != 404 ?
   Image.network(
    url,
    fit: BoxFit.cover,
    color: Colors.white.withOpacity(1),
    colorBlendMode: BlendMode.modulate,
  ) :
    Image(
      image: AssetImage("assets/images/altNewsPoster.jpeg"),),
  );
  return
    Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10,10,0,0),
          child: Container(
            width: 350,
            height: 230,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.3),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        Container(
          child: ClipRect(
            child:image,
            // Image.network(
            //   url,
            //   fit: BoxFit.cover,
            //   color: Colors.white.withOpacity(1),
            //   colorBlendMode: BlendMode.modulate,
            // ),
            //
            ),
          width: 350,
          height: 220,
        ),
       const   Positioned(
            left: 310,
            top: 180,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 30,
              color: Colors.white70,
            ),

        )
      ],
    );
}