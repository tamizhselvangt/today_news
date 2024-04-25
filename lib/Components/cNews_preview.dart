import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:day_today/utilities/fetchNewsApi.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:day_today/pages/articlePage.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';



Widget articlePreviewCard(String searchQuery){



  int timeDifference(String time) {
    String givenDateTimeString = time;
    DateTime givenDateTime = DateFormat('yyyy-MM-dd\'T\'HH:mm:ssZ').parse(givenDateTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(givenDateTime);
    double differenceInDays = difference.inDays.toDouble();
    return differenceInDays.toInt();
  }

  return Column(
    children: [
      Expanded(
        child: FutureBuilder<List<NewsArticle>>(
          future: fetchNewsArticle(searchQuery),
          builder: (BuildContext context, AsyncSnapshot<List<NewsArticle>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                  final article = snapshot.data![index];
                  var time = timeDifference(article.publishedAt!);
                  if (article.description == null || article.description!.isEmpty) return Container();
                  if (article.urlToImage == null || article.description!.isEmpty) return Container();
                   return GestureDetector(
                     onTap: (){
                       Navigator.push(context,
                           MaterialPageRoute(
                           builder: (context) => ArticlePage(
                           title: article.title!,
                           posterUrl: article.urlToImage!,
                           description: article.description,
                           source: article.source,
                           time: article.publishedAt,
                           url: article.url,
                           )));
                       },
                     child: Container(
                       decoration: const BoxDecoration(
                         border: Border(
                           top: BorderSide(width: 0.3, color: Colors.black54),
                           bottom: BorderSide(width: 0.2, color: Colors.black),
                         )
                     ),
                       child: Container(
                          color: Colors.transparent,
                          height: 510,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15,20,10,0),
                            child: Column(
                              children: [
                                Headline(),
                                const SizedBox(height: 10,),
                                articlePreviewTitle(article.title!),
                                const SizedBox(height: 10,),
                                previewPoster(article.urlToImage!),
                                const SizedBox(height: 10,),
                                articlePrevieDescription(article.description!),
                                const SizedBox(height: 20,),
                                articleBottomIcons(time),
                              ],
                            ),
                          ),
                        ),
                     ),
                   );
                  },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Lottie.asset("assets/animations/LoadingAnimation.json");
            }
          },
        ),
      ),
    ],
  );
}

class Headline extends StatelessWidget {

  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 2,
                decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  color: Color(0xfff3e386),
                ),
              ),
            ),
            const Text(
              "HEADLINE",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'PolySans'
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget articlePreviewTitle(String title){
  final desc = title.replaceAll("'", "\'").replaceAll(RegExp(r'[\u2018\u2019\u201C\u201D]'), "\'");
  final words = desc.split(' ');
  final first10Words = words.take(10).join(' ');
  return SizedBox(
    height: 70,
    child: RichText(
      text: TextSpan(
        text: "—",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 27,
          // letterSpacing: 0
        ),
        children: [
          TextSpan(
            text: "${first10Words}",
            style:const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 30,
                fontFamily: 'PolySans'
            ),
          ),
          const TextSpan(
            text: "...",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: 'LibreBaskerville-Regular'
            ),
          )
        ]
    ),
    ),
  );
}

Widget articlePrevieDescription(String description){
  final desc = description.replaceAll(RegExp(r'[\u2018\u2019\u201C\u201D]'), "\'");
  final words = desc.split(' ');
  final first20Words = words.take(20).join(' ');
  return SizedBox(
    height: 70,
    child: RichText(
      text: TextSpan(
        text: "${first20Words}",
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
        fontFamily: "FKRomanStandard",
        fontWeight: FontWeight.w700,),
        children: const [
          TextSpan(
            text: '...',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                height:0,
                fontFamily: "FKRomanStandard",
                fontWeight: FontWeight.bold
            ),
          ),
          TextSpan(
            text: 'More',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 18,
                fontFamily: "FKRomanStandard",
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget articleBottomIcons(int time){
  return SizedBox(
    height: 23,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            LikeButton(
                size: 23,
                circleColor:  CircleColor(
                    start: Color(0xff00ddff),
                    end: Color(0xff0099cc))
            ),
            SizedBox(width: 30,),
            Icon(Icons.volume_up_outlined,size: 25,
            color: Colors.black38,),
          ],
        ),
        Row(
          children: [
            Icon(Icons.access_time,
            size: 25,),

            Text("  ${time} days ago",
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
  // ColorFiltered(
  //   colorFilter: ColorFilter.matrix(<double>[
      // 0.2126,0.7152,0.0722,0,0,
      // 0.2126,0.7152,0.0722,0,0,
      // 0.2126,0.7152,0.0722,0,0,
      // 0,0,0,1,0,
    // ]),

    // child:
  var image = getImageStatusCode(url) != 404 ?
   ColorFiltered(
     colorFilter: const ColorFilter.matrix(<double>[
       0.4, 0.6, 0, 0, 0,
       0.4, 0.6, 0, 0, 0,
       0.4, 0.6, 0, 0, 0,
       0,   0,   0, 1, 0,
     ]),
     child: Image.network(
      url,
      fit: BoxFit.cover,
      color: Colors.white.withOpacity(1),
      colorBlendMode: BlendMode.modulate,
       ),
   ) :
    const Image(
      image: AssetImage("assets/images/altNewsPoster.jpeg"),);
  return
    SizedBox(
      height: 230,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10,10,0,0),
            child: Container(
              width: 350,
              height: 230,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 45,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ],
                border: Border.all(color: Colors.black, width: 2.3),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ),
          SizedBox(
            width: 350,
            height: 220,
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
      ),
    );
}