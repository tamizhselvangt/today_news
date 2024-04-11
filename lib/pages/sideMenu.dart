import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day_today/constants/constants.dart';
import 'package:gap/gap.dart';
import 'package:day_today/pages/finace/cryptoPage.dart';

class SideMenu extends StatelessWidget {
  final color;
  const SideMenu({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: 288,
        height: double.infinity,
        color: color,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              InfoCard(
                name: "Tamizhselavn",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Features",
                          style: TextStyle(
                              fontSize: 3,
                              fontFamily: "PolySans",
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                      Gap(20),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> CryptoPage()));
                          },
                          child: Text("   Wheather", style: kSideMenuTitleStyle)),
                      Gap(10),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> CryptoPage()));
                          },
                          child: Text("   Crypto", style: kSideMenuTitleStyle)),
                      Gap(10),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> CryptoPage()));
                        },
                          child: Text("   Forex", style: kSideMenuTitleStyle)),
                      Gap(10),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> CryptoPage()));
                          },
                          child: Text("   Stock", style: kSideMenuTitleStyle)),
                      Gap(10),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> CryptoPage()));
                          },
                          child: Text("   Calender", style: kSideMenuTitleStyle)),
                      Gap(10),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String? name;
  final String? profession;
  const InfoCard({this.name, this.profession});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.white54,
        child: Icon(
          CupertinoIcons.person_solid,
          color: Colors.white,
        ),
      ),
      title: Text(
        "$name",
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$profession",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w200)),
    );
  }
}
