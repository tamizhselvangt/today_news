import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day_today/constants/constants.dart';
import 'package:gap/gap.dart';
import 'package:day_today/pages/finace/cryptoPage.dart';
import 'package:day_today/pages/calendarPage.dart';

class SideMenu extends StatelessWidget {
  final color;
  const SideMenu({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
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
                emailId: "tamizhselvangt@gmail.com",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Features",
                          style: TextStyle(
                              fontSize: 25,
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
                                MaterialPageRoute(builder: (context)=> CalenderPage()));
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
  final String? emailId;
  const InfoCard({this.name, this.emailId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CircleAvatar(
        backgroundColor: Colors.white54,
        child: Image.network("https://pngall.com/wp-content/uploads/5/User-Profile-PNG-Picture.png",)
      ),
      title: Text(
        "$name",
        style:
            const TextStyle(
                fontSize: 18,
                color: Colors.black, fontWeight: FontWeight.w500),
      ),
      subtitle: Text("$emailId",
          style: const TextStyle(
              fontSize: 12,
              color: Colors.black54, fontWeight: FontWeight.w200)),
    );
  }
}
