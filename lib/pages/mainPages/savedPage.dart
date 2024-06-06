import 'package:day_today/Model/SavedArticles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:day_today/Components/cSavedPage.dart';
import 'package:day_today/utilities/dataBase_service.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:lottie/lottie.dart';

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
                 if(sharedArticles.isEmpty) {
                   return Container(
                     color: Colors.redAccent,
                   );
                 }else{
                final sharedArticle = sharedArticles[index];
                return sharedArticle;
              }
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
                 List saveArticles = snapshot.data != null ? snapshot.data!.docs : [];
                    // List saveArticles = snapshot.data!.docs ?? [];
                    if(saveArticles.isEmpty){
                      return Center(
                        child:  Column(
                          children: [
                            Lottie.asset("assets/animations/empty_Messages.json",
                            width: MediaQuery.of(context).size.width/1.3,
                            animate: true),
                            const Text("No Saved Articles",
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
                                      child: const OverflowBox(
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
                                  content: const Icon(Icons.remove_circle, color: Colors.red,
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
                                  child: const Icon(
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
            return SizedBox();
              // SharedArticleCard();
          },
        );
      }).toList(),
    );
  }
}

