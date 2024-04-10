import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFFBAA7E3),
        child: const SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              InfoCard(name: "Tamizhselavn",),
              Divider(
                color: Colors.blueGrey,
              ),
              ListTile(
                leading: Icon(Icons.home,
                size: 30.0,
                color: Colors.white,),
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
  const InfoCard({this.name,this.profession});

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
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$profession",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w200)),
    );
  }
}
