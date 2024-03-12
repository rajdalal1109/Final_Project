import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/login.dart';
import 'package:project/utils/appcolor.dart';

class UiScreen extends StatefulWidget {
  const UiScreen({super.key});

  @override
  State<UiScreen> createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn(),));});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,//background: rgba(255, 98, 96, 1);
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 90),
              child: Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tBus Booking \n Where Every Journey Begins !!",
                style: TextStyle(fontSize: 23,fontWeight: FontWeight.w300,color: Colors.white),),
            ),
            Lottie.network("https://lottie.host/6c65cab6-6666-49a4-a0a0-58a0416aaeb7/AqBS776xw5.json",height: 280),
            // Lottie.network("https://lottie.host/68b773b8-dbd9-4fd3-8676-eb26ade732ef/8lmoFYgxmf.json"),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogIn(),));
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 305,
                  decoration: BoxDecoration
                    (
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  height: 56,
                  child: Center(
                      child: Text("Get Started", style: TextStyle(fontSize: 20,color: AppColors.primary,fontWeight: FontWeight.w600),)
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
