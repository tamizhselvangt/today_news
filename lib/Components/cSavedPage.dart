
import 'package:day_today/pages/articlePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';


List<Widget> sharedArticles = [
    SharedArticleCard(
    cardTitle: "AirPods Pro Hearing Aid Mode Might Show Up in iOS 18",
    imageURL: "https://images.macrumors.com/t/U86ydPc-JWS1fnp62Jhs8V6obZc=/2500x/article-new/2024/02/Airpods-Max-Feature-Green-Triad.jpg",),

  SharedArticleCard(
    cardTitle: "Hasbro's New Star Wars Toys Herald The Acolyte",
    imageURL: "https://comicbookmovie.com/images/articles/banners/210269.jpg",
  ),

  SharedArticleCard(
    cardTitle: "Sony Entertainment Announced a Movie for God of War",
    imageURL: "https://cdn.ndtv.com/tech/gadgets/kratos_gow4_sony.jpg",
  ),
];


// List<SavedArticleCard> savedArticles = [
//
//   SavedArticleCard(
//       cardTitle: "What’s Behind the Bitcoin Price Surge? Vibes, Mostly",
//       imageURL: "https://media.wired.com/photos/65ef46042ca08b0e59a9682f/191:100/w_1280,c_limit/031124-business-bitcoin-economics.jpg",
//       cardDesc: "The price of bitcoin has climbed to a new all-time high. But assigning the cryptocurrency a value is anything but trivial."
//   ),
//
//   SavedArticleCard(
//       cardTitle: "Block starts shipping Bitkey, its \$150 bitcoin wallet debuted in 2022",
//       imageURL: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/211c9eec9707cddc1f0f3681decdd9b7.jpg",
//       cardDesc: "Emma Roth / The Verge:Block starts shipping Bitkey, its \$150 bitcoin wallet debuted in 2022, with a hardware device, mobile app, recovery tools, and Cash App and Coinbase integration "
//   ),
//
//   SavedArticleCard(
//       cardTitle: "Self-proclaimed bitcoin 'inventor' did not invent bitcoin, UK judge rules",
//       imageURL: "https://www.presse-citron.net/app/uploads/2024/01/unsplash-kanchanara-bitcoin.jpg",
//       cardDesc: "The approval of 11 spot Bitcoin ETFs earlier this year by the Securities and Exchange Commission has caused a storm in the ETF industry."
//   ),
//   SavedArticleCard(
//       cardTitle: "Block starts shipping Bitkey, its \$150 bitcoin wallet debuted in 2022",
//       imageURL: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/5b09d5e1ca463adf6a755677c2cf835b.jpg",
//       cardDesc: "Emma Roth / The Verge:Block starts shipping Bitkey, its \$150 bitcoin wallet debuted in 2022, with a hardware device, mobile app, recovery tools, and Cash App and Coinbase integration "
//   ),
// ];




class SavedArticleCard extends StatelessWidget {
  final cardTitle;
  final imageURL;
  final cardDesc;
  final url;
  final sourceName;
  final time;

  const SavedArticleCard({
    super.key,
    required this.cardTitle,
    required this.imageURL,
    required this.cardDesc,
    required this.url,
    required this.sourceName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all( 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticlePage(title: cardTitle, posterUrl: imageURL, description: cardDesc, source: sourceName, time: time, url: url)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
                child: Image.network(
                   imageURL,
                  width: 140,
                  height: 150,
                    fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 230,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(10),
                  SizedBox(
                    height: 40,
                    child: Text("${cardTitle}",
                      style: TextStyle(
                          fontFamily: "PolySans",
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                      ),),
                  ),
                  Gap(10),
                  SizedBox(
                    height: 40,
                    child: Text(
                      "${cardDesc}",
                      style: TextStyle(
                          color: Colors.black45,
                          fontFamily: "FKRomanStandard",
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                      ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LikeButton(
                        size: 23,
                         circleColor:  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc))
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: IconButton(
                          onPressed: (){

                            Share.share(url);
                          },
                          icon: Icon(
                              Icons.ios_share_rounded,
                             color: Color(0xff9E9E9E))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SharedArticleCard extends StatelessWidget {
  final cardTitle;
  final imageURL;
  const SharedArticleCard({
    super.key,@required this.cardTitle,@required this.imageURL
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageURL,
                      fit: BoxFit.cover,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                         onPressed: (){
                           Share.share('check out my website https://example.com');
                         },
                        icon:Icon(Icons.ios_share_rounded,color: Colors.white70,)),
                    Icon(Icons.more_vert_outlined,color: Colors.white70,),
                    Gap(20)
                  ],
                ),
              ) ,
              Padding(
                padding:EdgeInsets.only(top: 165.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                  ),
                  height: 80,
                  /* Card Text Here */
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "\"${cardTitle}\"",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "PolySans",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
