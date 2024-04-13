import 'package:day_today/pages/introPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffD4B1D6),
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(40),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    child: Image.network("https://pngall.com/wp-content/uploads/5/User-Profile-PNG-Picture.png",),
                    radius: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(68,67,0,0),
                    child: CircleAvatar(
                      radius: 20,
                      child: Center(child: IconButton(icon: Icon(Icons.edit_rounded),onPressed: (){},)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70,70,0,0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                              width: 2
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text("Tamizhselvan Gurusamy",style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  fontFamily: "PolySans",
                ),),
              ),
              Text("tamizhselvangt@gmail.com",style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontFamily: "PolySans",
              ),),
              Gap(30),
              SizedBox(
                width: 230,
                child: ElevatedButton(
                  onPressed: () async {
                  },
                  child: Text("Edit Profile",
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: "PolySans",
                      fontSize: 20,
                    ),),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(0, 50),
                      elevation: 5.0,
                      backgroundColor:  Color(0xffffd9e2)
                  ),
                ),
              ),
              Gap(50),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.transparent
                      ),
                      onPressed:(){},
                      child: settingsButtons(title: "Setting", icon: Icons.settings,)),
                  Gap(20),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.transparent
                      ),
                      onPressed:(){},
                      child: settingsButtons(title: "Notification", icon: Icons.notifications,)),
                  Gap(20),
                  TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.transparent
                      ),
                      onPressed:(){},
                      child: settingsButtons(title: "Languages", icon: Icons.language_rounded,)),
                  Gap(50),
                ],
              ),
              SizedBox(
                width: 230,
                child: ElevatedButton(
                  onPressed: () async {

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (cotext)=> Introduction()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout_rounded),
                      Text("Log out",
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: "PolySans",
                          fontSize: 20,
                        ),),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(0, 50),
                      elevation: 5.0,
                      backgroundColor:  Colors.grey.shade300
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class settingsButtons extends StatelessWidget {

  final title;
  final icon;
  const settingsButtons({
    super.key,this.title,this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white24,
              child: Icon(icon,
                size: 30,)),
          Text(title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
                fontFamily: "PolySans",
                fontWeight: FontWeight.w500
            ),),
          Gap(30),
          CircleAvatar(
              backgroundColor: Colors.white30,
              child: Icon(Icons.arrow_forward_ios_rounded))
        ],
      ),
    );
  }
}
