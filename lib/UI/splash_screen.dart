import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/login.dart';

class UiScreen extends StatefulWidget {
  const UiScreen({super.key});

  @override
  State<UiScreen> createState() => _UiScreenState();
}

class _UiScreenState extends State<UiScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
      //background: rgba(255, 98, 96, 1);
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 90),
              child: Text(
                "\t\t\t\t\t\t\t\t\t\t\tBus Booking....... \n Where Every Journey Begins !!",
                style: TextStyle(
                    fontFamily: "Yesteryear",
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            Lottie.network(
                "https://lottie.host/f40d84f7-e741-4342-8309-31f06609f687/bczEkPRu9i.json"),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LogIn(),
                ));
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 305,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 165, 34, 1),
                      //background: rgba(245, 165, 34, 1);
                      borderRadius: BorderRadius.circular(20)),
                  height: 56,
                  child: const Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
