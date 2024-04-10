import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:day_today/constants/constants.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:day_today/Components/cSavedPage.dart';
import 'package:like_button/like_button.dart';


class SavedArticlesPage extends StatelessWidget {
  const SavedArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F7BD),
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
                itemWidth: 400.0,
                itemHeight: 250.0,
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
                child: ListView.builder(
                  itemCount: savedArticles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return savedArticles[index];
                  },
                ),
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
