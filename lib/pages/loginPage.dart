import 'dart:ui';
import 'dart:io';
import 'package:day_today/pages/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
// import 'package:googleapis/apigeeregistry/v1.dart';
// import 'package:googleapis/cloudfunctions/v2.dart';
import 'package:lottie/lottie.dart';
import 'package:day_today/pages/mainPages/HomePage.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:day_today/auth_Services/auth_service.dart';


class LogInPage extends StatefulWidget {
  static const String id = 'SignUp_Page';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> with SingleTickerProviderStateMixin {

  bool isUserSelected = false;
  bool isPasswordSelected = false;
  late AnimationController _animationController;
  var isSubmitted = false;

  updateUI(){
    setState(() {
      isSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecc9c9),
      appBar: AppBar(
        backgroundColor: Color(0xffecc9c9),
        title: Text(
          'SignIn',
          style: TextStyle(fontSize: 25.0,
              fontFamily: "PolySans",
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(30),
                  isSubmitted ?  Lottie.asset("assets/animations/tickSucessfulAnimation.json",
                    height: 200,
                    width: 200,): Lottie.asset("assets/animations/logInAnimation.json",
                      height: 200,
                      width: 200),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFeild(placeHolder: "User Name", obscureText: false),
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
                      onPressed: () async {
                        setState(() {
                          isSubmitted = true;
                        });
                        await Future.delayed(Duration(seconds: 3));
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Text(
                        'SignIn',
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5.0,
                        // backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        //         (Set<MaterialState> states) {
                        //       return Colors.grey.shade50;
                        //     }),
                        // minimumSize: MaterialStateProperty.all(Size(25000, 45)),
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
                      onPressed: () {
                        showModalBottomSheet(context: context, builder:(BuildContext context){
                          return Container(
                            height: 350,
                            decoration: BoxDecoration(
                                color: Color(0xffE5BDC1),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                SocialLoginButton(
                                  height: 50,
                                  width: 300,
                                  borderRadius: 10,
                                  buttonType: SocialLoginButtonType.google,
                                  onPressed: () {

                                    authenticateWithGoogle(context: context);
                                  },
                                ),
                                SizedBox(height: 20),
                                Platform.isIOS ? SocialLoginButton(
                                  height: 50,
                                  width: 300,
                                  borderRadius: 10,
                                  buttonType: SocialLoginButtonType.appleBlack,
                                  onPressed: () {},
                                ) : Gap(0),
                                SizedBox(height: 20),
                                SocialLoginButton(
                                  backgroundColor: Color(0xff0866FF),
                                  imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png",
                                  height: 50,
                                  width: 300,
                                  borderRadius: 10,
                                  buttonType: SocialLoginButtonType.facebook,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          );
                        });
                      },
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                        },
                        child: Text(
                          'Don\'t have account? Sign up',
                          style: TextStyle(
                            // color: Colors.green.shade400
                          ),
                        ),
                      )),
                  const Divider(
                    color: Color(0xFF9DA9A5),
                    height: 25,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack CustomTextFeild({@required placeHolder, @required obscureText}) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Container(
            height: 65,
            width: 280,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
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
  Future<void> authenticateWithGoogle({required BuildContext context})async{
    try{
      await AuthService().signInWithGoogle();
      setState(() {
        isSubmitted = true;
      });
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }catch(e){
      AlertDialog(
        content: Text("Authentication Not Permitted "
            "Try agai!"),

      );
    }
  }
}






