import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f7bd),
      appBar: AppBar(
        backgroundColor: Color(0xfff2f7bd),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
            Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1.2,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xfff3e386),
                    ),
                  ),
                ),
                Text(
                  "HEADLINE",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Mono sans'
                  ),
                ),
              ],
            ),
          ),
             SizedBox(height: 20,),
             Text("Bitcoin price hits record \$69K after SEC "
                 "approvals fueled \$7B in investments",
             style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.w900,
               // fontFamily: "RobotoSlab"
               fontFamily: "LibreBaskerville-Bold"
             ),),
              SizedBox(height: 30,),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5,5,0,0),
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    border: Border.all(color: Colors.black, width: 2.3),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
              Container(
                child: ClipRect(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.person_add_alt_outlined,
                          color: Colors.white,
                          size: 25,),
                        Text("Follow",
                          style: TextStyle(
                            color: Colors.white,
                          fontFamily: "RobotoSlab",
                          fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2.3),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                ),
                width: 100,
                height: 40,
              ),
            ],
          )
            ],
          ),
        ),
      )
    );
  }
}



