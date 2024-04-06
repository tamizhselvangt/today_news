import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class ExamplePage extends StatefulWidget {
  static const String id = 'SignUp_Page';

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool isUserSelected = false;
  bool isPasswordSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecc9c9),
      appBar: AppBar(
        backgroundColor: Color(0xffecc9c9),
        title: Text(
          'SignIn',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(30),
                  Lottie.asset("assets/animations/logInAnimation.json",
                  height: 200,
                  width: 200),
                  SizedBox(
                    height: 20.0,
                  ),
                  textFeild(placeHolder: "User Name", obscureText: false),
                  SizedBox(
                    height: 25.0,
                  ),
                  passwordtextFeild(placeHolder: "Password", obscureText: true),
                  SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    width: 280,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'SignIn',
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return Colors.grey.shade50;
                        }),
                        minimumSize: MaterialStateProperty.all(Size(25000, 45)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Your Password ?',
                        style: TextStyle(
                            // color: Colors.green.shade400,
                            ),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Don\'t have account? Sign up',
                        style: TextStyle(
                            // color: Colors.green.shade400
                            ),
                      )),
                  const Divider(
                    color: Color(0xFF9DA9A5),
                    height: 25,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  // FacebookAuthentication(),
                  SizedBox(
                    height: 20.0,
                  ),
                  // AppleAuthentication(),
                  SizedBox(
                    height: 20.0,
                  ),
                  // GoogleAuthentication(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack textFeild({@required placeHolder, @required obscureText}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Container(
            height: 65,
            width: 280,
            decoration: BoxDecoration(
              color: isUserSelected ? Colors.white : Colors.transparent,
              border: Border.all(color: Colors.black, width: 1.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Container(
          height: 65,
          width: 280,

          decoration: BoxDecoration(
            color: Color(0xffe5a3a3),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            style: TextStyle(
                fontFamily: "PolySans",
                fontSize: 20,
                fontWeight: FontWeight.w500),
            onTap: () {
              setState(() {
                isUserSelected = true;
                isPasswordSelected = false;
              });
            },
            onTapOutside: (_) {
              setState(() {
                isUserSelected = false;
              });
            },
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.black),
              ),
              border:
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
              labelText: placeHolder,
              hintText: "example@gmail.com",
              hintStyle: TextStyle(
                color: Colors.white54,
                fontSize: 20,
                fontWeight: FontWeight.w100
              )
            ),
          ),
        ),
      ],
    );
  }

  Stack passwordtextFeild({@required placeHolder, @required obscureText}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Container(
            height: 65,
            width: 280,
            decoration: BoxDecoration(
              color: isPasswordSelected ? Colors.white : Colors.transparent,
              border: Border.all(color: Colors.black, width: 1.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Container(
          height: 64,
          width: 280,
          decoration: BoxDecoration(
            color: Color(0xffe5a3a3),
            borderRadius: BorderRadius.circular(10),
          ),

          child: TextField(
            onTap: () {
              setState(() {
                isPasswordSelected = true;
                isUserSelected = false;
              });
            },
            onTapOutside: (_) {
              setState(() {
                isPasswordSelected = false;
              });
            },
            obscureText: obscureText,
            decoration: InputDecoration(
              // hintText: "Password",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2,
                    color: Colors.black),
              ),
              // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
              labelText: placeHolder,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w100,
                fontFamily: "PolySans",
                fontSize: 18,
                // fontWeight: FontWeight.w400
              )
            ),
          ),
        ),
      ],
    );
  }
}
