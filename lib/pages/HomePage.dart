import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_today/Components/cNews_preview.dart';
import 'package:day_today/utilities/selectedDomain.dart';
import "package:day_today/constants/constants.dart";
import 'package:day_today/pages/sideMenu.dart';
import 'dart:math';
import 'package:day_today/pages/savedPage.dart';
import 'package:day_today/pages/searchPage.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalanimation;
   var selectedPAge = "Home";

  Widget selectPage(String page){
    if(selectedPAge =="Home"){
      return HomeScreen();

    }else if(selectedPAge == "Saved"){
      return SavedArticlesPage();
    }else{
      return HomeScreen();
    }
  }

  @override
  void initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    scalanimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBAA7E3),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
          children: [
        AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu()),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value - 30 * animation.value * pi / 180),
          child: Transform.translate(
            offset: Offset(animation.value * 265, 0),
            child: Transform.scale(
                scale: scalanimation.value,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(020)),
                    child: selectPage(selectedPAge),
                )),
          ),
        ),
        SafeArea(
          child: IconButton(
              onPressed: () {
                bool value = false;
                setState(() {
                  if (isSideMenuClosed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  isSideMenuClosed = !isSideMenuClosed;
                });
              },
              icon: Icon(
                Icons.menu_rounded,
                size: 35.0,
                color: Colors.black54,
              )),
        ),
      ]),

      // TODO Bottom  Navigation BAR

      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TODO HOME
            GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() {
                  selectedPAge = "Home";
                });
              },
              child: Container(
                height: 53,
                width: 50,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Home_icn.png',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            // TODO SEARCH
            GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                showSearch(context: context, delegate: MySearchDelegate());
              },
              child: Container(
                height: 28,
                width: 28,
                child: Image.asset(
                  "assets/images/Search_icn.png",
                  color: Colors.black,
                ),
              ),
            ),
            // TODO SAVEDARTICLES
            GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
                setState(() {
                selectedPAge = "Saved";
                });
              },
              child: Container(
                height: 37,
                width: 37,
                child: Image.asset(
                  "assets/images/bookmark-icon-12335.png",
                  color: Colors.black,
                ),
              ),
            ),
            // TODO USERPROFILE
            GestureDetector(
              onTap: () {
                HapticFeedback.selectionClick();
              },
              child: Container(
                height: 30,
                width: 30,
                child: Image.asset(
                  "assets/images/user-profile-computer-icons-clip-art-profile-9b170674c66dad5d9f7730bb0d1c999f.png",
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE1CDFF),
      appBar: AppBar(
        backgroundColor: Color(0xffE1CDFF),
      ),
      body: Column(
        children: [
          TopDomainTitles(),
          articlePreviewCard(context.watch<SelectedDomain>().selectedQuery),
        ],
      ),
    );
  }
}



class TopDomainTitles extends StatelessWidget {
  const TopDomainTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // bool selectedHome = true;
    // bool selectedTech = false;
    // bool selectedPolitics = false;
    // bool selectedCrypto = false;
    // bool selectedMarket = false;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(width: 0.3, color: Colors.black54),
          bottom: BorderSide(width: 0.2, color: Colors.black),
        )),
        child: StatefulBuilder(builder: (context, setState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<SelectedDomain>().selectedButton(0);
                  },
                  child: Text(
                    "HOME",
                    style: context.watch<SelectedDomain>().buttonPressed[0]
                        ? kTopBarSelectedTitle
                        : kTopBarTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<SelectedDomain>().selectedButton(1);
                  },
                  child: Text(
                    "TECH",
                    style: context.watch<SelectedDomain>().buttonPressed[1]
                        ? kTopBarSelectedTitle
                        : kTopBarTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<SelectedDomain>().selectedButton(2);
                  },
                  child: Text(
                    "POLITICS",
                    style: context.watch<SelectedDomain>().buttonPressed[2]
                        ? kTopBarSelectedTitle
                        : kTopBarTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<SelectedDomain>().selectedButton(3);
                  },
                  child: Text(
                    "CRYPTO",
                    style: context.watch<SelectedDomain>().buttonPressed[3]
                        ? kTopBarSelectedTitle
                        : kTopBarTitle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GestureDetector(
                  onTap: () {
                   context.read<SelectedDomain>().selectedButton(4);
                  },
                  child: Text(
                    "MOVIES",
                        style: context.watch<SelectedDomain>().buttonPressed[4]
                        ? kTopBarSelectedTitle
                        : kTopBarTitle,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
