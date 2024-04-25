import 'dart:developer';

import 'package:day_today/Model/SavedArticles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:day_today/constants/constants.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:day_today/Components/cSavedPage.dart';
import 'package:day_today/utilities/dataBase_service.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SavedArticlesPage extends StatelessWidget {
  SavedArticlesPage({super.key});
  final DataBaseService _dataBaseService = DataBaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFDAB9),
      body: SafeArea(
          child:   Column(
            children: [
              Gap(50),
              Text("Shared Article",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                fontFamily: "PolySans",
              ),),
              Swiper(
                indicatorLayout: PageIndicatorLayout.COLOR,
                itemBuilder: (BuildContext context, int index) {
                  final sharedArticle = sharedArticles[index];
                  return sharedArticle;
                },
                itemCount: 3,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height/3.5,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  margin: const EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  Gap(30),
                  Text("Saved Article",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                      fontFamily: "PolySans",
                    ),),
                ],
              ),
              Expanded(
                child: StreamBuilder(
                  stream: _dataBaseService.getSavedArticles(),
                  builder: (context, snapshot){
                    List saveArticles = snapshot.data?.docs ?? [];
                    if(saveArticles.isEmpty){
                      return Center(
                        // child: Lottie.asset("assets/animations/noMessage.json"),
                        child:  Column(
                          children: [
                            Gap(20),
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(Color(0xffFFDAB9), BlendMode.color),
                              child: Image.asset("assets/images/Untitled design.jpg",
                               height: 200,
                                color: Color(0xFFFFDAB9),
                                colorBlendMode: BlendMode.modulate,
                              )),
                            Text("No Saved Articles",
                              style: TextStyle(
                                  fontFamily: "PolySans",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black26
                              ),),
                          ],
                        )
                      );
                    }
                    else{
                      return ListView.builder(
                        itemCount: saveArticles.length,
                      itemBuilder: (context , index){
                          SavedArticles savedArticle = saveArticles[index].data();
                          String articleId = saveArticles[index].id;
                        return SwipeActionCell(
                            backgroundColor: Color(0xffFFDAB9),
                            key: ObjectKey(savedArticle),
                            trailingActions: [
                              SwipeAction(
                                  nestedAction: SwipeNestedAction(
                                    /// customize your nested action content
                                    content: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.red,
                                      ),
                                      width: 130,
                                      height: 60,
                                      child: OverflowBox(
                                        maxWidth: double.infinity,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                            Text('Delete',
                                                style: TextStyle(color: Colors.white, fontSize: 20)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  color: Colors.transparent,
                                  content: Icon(Icons.remove_circle, color: Colors.red,
                                  size: 45,),
                                  onTap: (handler) async {
                                    await handler(true);
                                    _dataBaseService.removeArticle(articleId);
                                  }),
                              SwipeAction(
                                  onTap: (onTap){},
                                content: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blueGrey,
                                  ),
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.archive_sharp,
                                  size: 25,
                                  color: Colors.white60,),
                                ),
                              color: Colors.transparent),

                            ],
                            child: SavedArticleCard(
                              cardTitle: savedArticle.title,
                              imageURL: savedArticle.urlToImage,
                              cardDesc: savedArticle.description,
                              sourceName: savedArticle.source,
                              url: savedArticle.url,
                              time: savedArticle.publishedAt,
                            ));
                      },
                      );
                    }
                  },
                )
              ),
            ],
          )

        // ListView(
          //   children: [
          //     Gap(40),

          //     Gap(30),
          //     ListView.builder(
          //       itemCount: savedArticles.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return savedArticles[index];
          //       },
          //     )
            // ],
          // )
      ),
    );
  }
}

class optinalSliderWidget extends StatelessWidget {
  const optinalSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 250.0,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(),
      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SharedArticleCard();
          },
        );
      }).toList(),
    );
  }
}

// class SavedArticleCard extends StatelessWidget {
//   const SavedArticleCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 150,
//         decoration: BoxDecoration(
//             color: Colors.amberAccent,
//             borderRadius: BorderRadius.circular(20)
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
//               child: Image.network(
//                   width: 140,
//                   height: 150,
//                   fit: BoxFit.cover,
//                   "https://cdn.ndtv.com/tech/gadgets/kratos_gow4_sony.jpg"),
//             ),
//             Container(
//               width: 230,
//               padding: EdgeInsets.symmetric(horizontal: 5),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Gap(10),
//                   Text("Microsoft may be working on an",
//                     style: TextStyle(
//                         fontFamily: "PolySans",
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500
//                     ),),
//                   Gap(5),
//                   Text("Microsoft may be working on a white version of its current all-digital Xbox Series X ",
//                     style: TextStyle(
//                         color: Colors.black45,
//                         fontFamily: "PolySans",
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500
//                     ),),
//                   Gap(15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Gap(100),
//                       Icon(Icons.favorite_outline_rounded),
//                       Icon(Icons.ios_share_outlined)
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SharedArticleCard extends StatelessWidget {
//   const SharedArticleCard({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Container(
//           height: 250,
//           child: Stack(
//             children: [
//               Container(
//                 height: 250,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.network(
//                       fit: BoxFit.cover,
//                       "https://cdn.ndtv.com/tech/gadgets/kratos_gow4_sony.jpg"),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Icon(Icons.ios_share_rounded,color: Colors.white70,),
//                     Icon(Icons.more_vert_outlined,color: Colors.white70,),
//                     Gap(20)
//                   ],
//                 ),
//               ) ,
//               Padding(
//                 padding:EdgeInsets.only(top: 170.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     // color: Colors.white,
//                     borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//                   ),
//                   height: 80,
//                   /* Card Text Here */
//                   child: Center(
//                     child: Text("Microsoft may be ",
//                       style: TextStyle(
//                           color: Colors.white70,
//                           fontFamily: "PolySans",
//                           fontSize: 30,
//                           fontWeight: FontWeight.w700
//                       ),),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
