import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:BusBuddy/UI/bottombar.dart';
import 'package:BusBuddy/login.dart';
import 'package:BusBuddy/utils/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class UiScreen extends StatefulWidget {
  const UiScreen({super.key});

  @override
  State<UiScreen> createState() => UiScreenState();
}

class UiScreenState extends State<UiScreen> {
  static const String keylogin = "Login";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  Image.asset("assets/images/feature/BusBuddy-logo.png"),
                  Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWhere Every Journey Begins !!",
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.black),),
                ],
              ),
            ),
            Lottie.network("https://lottie.host/633f562b-a236-40b5-b655-07c97fdb4190/PYgUEWoKLZ.json",height: 280),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/images/feature/splash_image.png"),
            ),
            //Lottie.network("https://lottie.host/6c65cab6-6666-49a4-a0a0-58a0416aaeb7/AqBS776xw5.json",height: 280),
            // Lottie.network("https://lottie.host/68b773b8-dbd9-4fd3-8676-eb26ade732ef/8lmoFYgxmf.json"),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogIn(),));
            //   },
            //   child: Container(
            //       margin: const EdgeInsets.only(top: 10),
            //       width: 305,
            //       decoration: BoxDecoration
            //         (
            //           color: AppColors.secondary,
            //           borderRadius: BorderRadius.circular(8)
            //       ),
            //       height: 56,
            //       child: Center(
            //           child: Text("Get Started", style: TextStyle(fontSize: 20,color: AppColors.primary,fontWeight: FontWeight.w600),)
            //       )
            //   ),
            // ),
          ],
        ),
      ),
    );
  }


  void whereToGo() async{
    var sheredPref = await SharedPreferences.getInstance();
    String? islogin = sheredPref.getString(keylogin);
    print("You are login to nacho ab!! $islogin");
    Timer(const Duration(seconds: 5), () {
      if(islogin != null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottoBar(cId: islogin,),));
      }else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogIn(),));
      }
    });
  }

}

