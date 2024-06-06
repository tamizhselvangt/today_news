import 'dart:ui';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:day_today/pages/mainPages/HomePage.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:day_today/auth_Services/auth_service.dart';






class SignUpPage extends StatefulWidget {
  static const String id = 'SignUp_Page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {


  String email="" , password="";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  bool isUserSelected = false;
  bool isPasswordSelected = false;
  var isSubmitted = false;

  updateUI(){
    setState(() {
      isSubmitted = true;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffecc9c9),
      appBar: AppBar(
        backgroundColor: const Color(0xffecc9c9),
        title: const Text(
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
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(30),
                  isSubmitted ?  Lottie.asset("assets/animations/tickSucessfulAnimation.json",
                  height: 200,
                  width: 200,): Lottie.asset("assets/animations/logInAnimation.json",
                      height: 200,
                      width: 200),
                  const Gap(20),
                  ///USERName Text Feild
                  emailIDTextFeild(placeHolder: "User Name", obscureText: false),
                  const Gap(25),
                  ///Password TextFeild
                  passwordtextFeild(placeHolder: "Password", obscureText: true),
                  const Gap(25),
                  SizedBox(
                    width: 280,
                    child: ElevatedButton(
                      onPressed: () async {
                        emailRegistration();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 3.0,
                      ),
                      child: const Text(
                        'SignIn',
                      ),
                    ),
                  ),
                  const Gap(25),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Your Password ?',
                        style: TextStyle(
                          // color: Colors.green.shade400,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        showModalBottomSheet(context: context, builder:(BuildContext BottomSheetcontext){
                          return Container(
                           height: 350,
                           decoration: const BoxDecoration(
                             color: Color(0xffE5BDC1),
                             borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                           ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                               children: [
                                 const SizedBox(height: 10),
                                 SocialLoginButton(
                                   height: 50,
                                   width: 300,
                                   borderRadius: 10,
                                   buttonType: SocialLoginButtonType.google,
                                   onPressed: () async{
                                     Navigator.pop(BottomSheetcontext);
                                     var googleAuth = await AuthService().signInWithGoogle();

                                     if(googleAuth!=null) {
                                       setState(() {
                                         isSubmitted = true;
                                       });
                                       await Future.delayed(
                                           const Duration(seconds: 3));
                                       Navigator.pushReplacement(context,
                                           MaterialPageRoute(
                                               builder: (context) =>
                                                   const HomePage()));
                                     }
                                   },
                                 ),
                                const Gap(20),
                                 Platform.isIOS ? Column(
                                   children: [
                                     SocialLoginButton(
                                       height: 50,
                                       width: 300,
                                       borderRadius: 10,
                                       buttonType: SocialLoginButtonType.appleBlack,
                                       onPressed: () {},
                                     ),
                                     const SizedBox(height: 20),
                                   ],
                                 ) : const Gap(0),

                                 SocialLoginButton(
                                   backgroundColor: const Color(0xff0866FF),
                                   imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/6c/Facebook_Logo_2023.png",
                                   height: 50,
                                   width: 300,
                                   borderRadius: 10,
                                   buttonType: SocialLoginButtonType.facebook,
                                   onPressed: () async{
                                     Navigator.pop(BottomSheetcontext);
                                    try {
                                          var fbUser = await AuthService()
                                              .signInWithFacebook();
                                          if (fbUser != null) {
                                            setState(() {
                                              isSubmitted = true;
                                            });
                                            await Future.delayed(
                                                const Duration(seconds: 3));
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()));
                                          }
                                        }catch(e){
                                      print(e);
                                    }
                                      },
                                 ),
                               ],
                             ),
                          );
                        });
                      },
                      child: const Text(
                        'Don\'t have account? Sign up',
                        style: TextStyle(
                          // color: Colors.green.shade400
                        ),
                      )),
                  const Divider(
                    color: Color(0xFF9DA9A5),
                    height: 25,
                    thickness: 1,
                    indent: 25,
                    endIndent: 25,
                  ),
                  const SizedBox(
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

  Stack emailIDTextFeild({@required placeHolder, @required obscureText}) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Container(
            height: 65,
            width: 280,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(0, 0), // changes position of shadow
                 ),
          ],
              color: isUserSelected ? Colors.white : Colors.transparent,
              border: Border.all(color: isUserSelected ? Colors.black : Colors.black54, width: isUserSelected ? 1.4 : 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Container(
          height: 65,
          width: 280,

          decoration: BoxDecoration(
            color: const Color(0xffe5a3a3),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Form(
            key: _emailKey,
            child: TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return "Please Enter a Valid Email";
                }
                return null;
              },
              controller: emailController,
              style: const TextStyle(
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
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black),
                  ),
                  border:
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: placeHolder,
                  hintText: "example@gmail.com",
                  hintStyle: const TextStyle(
                      color: Colors.white54,
                      fontSize: 20,
                      fontWeight: FontWeight.w100
                  )
              ),
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
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Container(
            height: 65,
            width: 280,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 15,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
              color: isPasswordSelected ? Colors.white : Colors.transparent,
              border: Border.all(color:isPasswordSelected ? Colors.black : Colors.black54, width: isPasswordSelected ? 1.3 : 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Container(
          height: 64,
          width: 280,
          decoration: BoxDecoration(
            color: const Color(0xffe5a3a3),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Form(
            key: _passwordKey,
            child: TextFormField(
              validator: (value){
                if(value==null||value.isEmpty){
                  return "Please Enter a Correct password";
                }
                return null;
              },
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
              controller: passwordController,
              obscureText: obscureText,
              decoration: InputDecoration(
                // hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 2,
                        color: Colors.black),
                  ),
                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                  labelText: placeHolder,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w100,
                    fontFamily: "PolySans",
                    fontSize: 18,
                    // fontWeight: FontWeight.w400
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }

  void emailRegistration() async {
  if(password!=null){
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registered Successfully")));
      setState(() {
        isSubmitted = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }on FirebaseAuthException catch (e){
      if(e.code == "weak-password"){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password Provided is too weak")));
      }else if(e.code == "email-already-in-use"){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Email is already Registered")));
      }
    }
  }
  }

  Future<void> authenticateWithGoogle({required BuildContext context})async{
    try{
      Navigator.pop(context);
      var googleAuth = await AuthService().signInWithGoogle();
      print(googleAuth);
      setState(() {
        isSubmitted = true;
      });
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));

    }catch(e){
      print(e);
      const AlertDialog(
        content: Text("Authentication Not Permitted "
            "Try agai!"),

      );
    }
  }
}






