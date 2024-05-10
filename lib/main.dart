// import 'package:flutter/material.dart';
// import 'UI/splash_screen.dart';
//
// void main()  {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(fontFamily: "Ubuntu"),
//       title: 'BusBuddy',
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(title: "BusBuddy"),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body : UiScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'UI/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Ubuntu"),
      title: 'BusBuddy',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "BusBuddy"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool _isConnected = true; // Assume initially connected to network

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      setState(() {
        // Check if there is at least one connectivity result in the list
        _isConnected = results.isNotEmpty && results.contains(ConnectivityResult.wifi) || results.contains(ConnectivityResult.mobile);
      });
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isConnected ? UiScreen() : ErrorScreen(), // Show UiScreen if connected, otherwise show ErrorScreen
    );
  }
}

// Define ErrorScreen widget to show when network is not available
class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("animations/network.json"),
          Text('You are offline!',style:TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Text('Please connect to the internet and retry',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
