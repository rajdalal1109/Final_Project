import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/UI/homepage_1.dart';
import 'package:project/UI/profile.dart';
import 'package:project/UI/ticket.dart';

class BottoBar extends StatefulWidget {
  String? cId;

  BottoBar({this.cId});

  @override
  State<BottoBar> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BottoBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    print('CustomerId In BottomBar::::${widget.cId}');
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          HomePage(),
          Tickets(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentIndex: currentPageIndex,
        selectedItemColor: const Color.fromRGBO(255, 98, 96, 1),
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tickets), label: "Tickets"),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.profile_circled),
              label: "Profile"),
        ],
      ),
    );
  }
}
