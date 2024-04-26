import 'package:day_today/pages/webViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:day_today/constants/constants.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:neopop/neopop.dart';
import 'package:flutter/services.dart';

Text articleTitle(String title) {
  return Text("—${title}", style: kNewsArticleTitle);
}

Align newsHeadLine() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Stack(
      children: [
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          left: 0,
          right: 0,
          child: Container(
            height: 10,
            decoration: const BoxDecoration(
              color: Color(0xfff3e386),
            ),
          ),
        ),
        const Text(
          "NEWS",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              fontFamily: 'PolySans'),
        ),
      ],
    ),
  );
}

RichText articleContent(String content) {
  return RichText(
      text: TextSpan(
          text:
              "${content} In the depths of the ocean, where sunlight struggles to penetrate, lies a realm of mystery and power: underwater volcanoes. These geological marvels, often hidden from human eyes, play a crucial role in shaping the Earth's surface and influencing oceanic ecosystems in ways we are only beginning to understand.\n\n"
              "Scientists have long been intrigued by these submerged giants, which differ in many ways from their terrestrial counterparts. While traditional volcanoes are well-documented and studied, their underwater counterparts remain largely unexplored due to the technical challenges of oceanic research. However, recent advances in underwater technology have allowed researchers to delve deeper into this hidden world.\n\n"
              "One such expedition, led by a team of marine biologists and geologists, set out to explore the Pacific Ring of Fire—a vast region known for its high concentration of underwater volcanoes and seismic activity. Equipped with state-of-the-art submersibles and remote sensing equipment, the team descended into the depths in search of answers.\n\n"
              "What they discovered was nothing short of extraordinary. Beneath the surface, they encountered a diverse array of volcanic features, including towering seamounts, hydrothermal vents, and ancient calderas. These underwater landscapes teemed with life, from colorful coral reefs to bizarre deep-sea creatures adapted to extreme conditions.\n\n"
              "But it wasn't just the geology and biology of underwater volcanoes that fascinated the researchers. They were also intrigued by the potential implications of these submerged behemoths for climate and ocean circulation. Recent studies have suggested that underwater volcanic activity may play a significant role in regulating global temperatures and influencing weather patterns.\n\n"
              "Furthermore, the release of gases and minerals from underwater volcanoes can have profound effects on marine ecosystems, providing essential nutrients and creating unique habitats for marine life. Understanding these processes is crucial for predicting and mitigating the impact of volcanic eruptions on both human populations and the environment.\n\n"
              "Despite the challenges of studying underwater volcanoes, researchers remain determined to unlock their secrets. By combining cutting-edge technology with interdisciplinary collaboration, they hope to shed light on these enigmatic structures and their role in shaping the world beneath the waves.\n\n"
              "As our understanding of underwater volcanoes grows, so too does our appreciation for the interconnectedness of Earth's systems. From the depths of the ocean to the highest peaks, the forces of nature continue to inspire awe and wonder, reminding us of the beauty and complexity of our planet.\n\n",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: "FKRomanStandard",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            wordSpacing: 2,
            height: 1.2,
          )));
}

Widget articlePoster(String posterUrl) {
  return Container(
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Container(
            width: 350,
            height: 230,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 65,
                  offset: const Offset(5, 5), // changes position of shadow
                ),
              ],
              border: Border.all(color: Colors.black, width: 2.3),
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
        SizedBox(
          width: 340,
          height: 225,
          child: ClipRect(
            child: Image.network(
              posterUrl,
              fit: BoxFit.cover,
              color: Colors.white.withOpacity(1),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
        Positioned(
          left: 300,
          top: 190,
          child: Stack(
            children: [
              Container(
                  height: 30,
                  width: 31,
                  decoration: const BoxDecoration(color: Color(0xfff5d548))),
              const Icon(
                Icons.camera_alt_outlined,
                size: 30,
                color: Colors.black87,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Align HeadLine() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Stack(
      children: [
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          left: 0,
          right: 0,
          child: Container(
            height: 14,
            decoration: const BoxDecoration(
              color: Color(0xfff3e386),
            ),
          ),
        ),
        const Text(
          "HEADLINE",
          style: TextStyle(
              fontSize: 25,
              letterSpacing: 1,
              fontWeight: FontWeight.w800,
              fontFamily: 'PolySans'),
        ),
      ],
    ),
  );
}

Align articleSource(String sourceName) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Stack(
      children: [
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Container(
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 4,
          left: 0,
          right: 0,
          child: Container(
            height: 12,
            decoration: const BoxDecoration(
              color: Color(0xfff3e386),
            ),
          ),
        ),
        Text(
          "Source: ${sourceName}",
          style: const TextStyle(
              fontSize: 25,
              letterSpacing: 1,
              fontWeight: FontWeight.w800,
              fontFamily: 'PolySans'),
        ),
      ],
    ),
  );
}

Widget followBtn() {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(6, 5, 0, 0),
        child: Container(
          width: 145,
          height: 45,
          decoration: BoxDecoration(
            // color: Colors.black
            border: Border.all(color: Colors.black, width: 2.3),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Image.asset(
            "assets/images/stripe.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      NeoPopButton(
        color: Colors.black,
        bottomShadowColor: ColorUtils.getVerticalShadow(Colors.transparent).toColor(),
        // buttonPosition: Position.fullBottom,
        rightShadowColor:
            ColorUtils.getHorizontalShadow(Colors.transparent).toColor(),
        onTapUp: () => HapticFeedback.vibrate(),
        onTapDown: () => HapticFeedback.vibrate(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_alt_outlined,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Follow",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Futura-Book",
                    fontSize: 18,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      )
      // SizedBox(
      //   width: 120,
      //   height: 40,
      //   child: ClipRect(
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.black,
      //         border: Border.all(color: Colors.black, width: 2.3),
      //         borderRadius: BorderRadius.circular(0.0),
      //       ),
      //       child: const Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Icon(
      //             Icons.person_add_alt_outlined,
      //             color: Colors.white,
      //             size: 25,
      //           ),
      //           Text(
      //             "Follow",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontFamily: "Futura-Book",
      //                 fontSize: 18,
      //                 letterSpacing: 2,
      //                 fontWeight: FontWeight.w500
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    ],
  );
}

Stack openArticleBtn(String url, context) {
  WebViewController controller = WebViewController()
    ..loadRequest(Uri.parse(url));
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            // color: Colors.black,
            border: Border.all(color: Colors.black, width: 2.3),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Image.asset(
            "assets/images/stripe.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 200,
        height: 50,
        child: ClipRect(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebViewPage(
                            controller: controller,
                          )));
              // showModalBottomSheet(context: context, builder: (BuildContext ccontext){
              //   return Container(
              //       height: MediaQuery.of(context).size.height -100,
              //       child: Expanded(child: WebViewWidget(
              //         controller: controller,
              //       )));
              // });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.black, width: 2.3),
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Open Article",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Futura-Book",
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    color: Colors.black,
                    Icons.arrow_forward,
                    size: 30,
                    weight: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}

class snackBarInfo extends StatelessWidget {
  const snackBarInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            padding: EdgeInsets.all(16),
            height: 90,
            decoration: BoxDecoration(
                color: Color(0xfffada5f),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(48),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Never Miss Out!",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 2,
                            fontFamily: "PolySans",
                            fontWeight: FontWeight.w600,
                            color: Colors.black45),
                      ),
                      Spacer(),
                      Text(
                        "This article's waiting for you.",
                        style: TextStyle(
                            fontSize: 13,
                            letterSpacing: 1,
                            fontFamily: "PolySans",
                            fontWeight: FontWeight.w600,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                "assets/images/bubbles.svg",
                color: Color(0xffc69f26),
                height: 48,
                width: 40,
              ),
            )),
        Positioned(
          top: -10,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/fail.svg",
                color: Color(0xffc69f26),
                height: 35,
              ),
              Positioned(
                  top: 4,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
