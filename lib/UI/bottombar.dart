import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/UI/homepage_1.dart';
import 'package:project/UI/profile.dart';
import 'package:project/UI/ticket.dart';
import 'package:project/utils/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class BottoBar extends StatefulWidget {
  String? cId;

  BottoBar({this.cId});

  @override
  State<BottoBar> createState() => _BottoBarState();
}

class _BottoBarState extends State<BottoBar> {
  final TextEditingController _number = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  String? name;
  String? mobile;
  String? email;

  int currentPageIndex = 0;
  late SharedPreferences prefs;
  displayName() async
  {
    final response = await http.post(Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/displayuser.php"),
        body:
        jsonEncode(
            {
              "cid":widget.cId.toString(),
            }
        )
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) ;

      print(response.body);
      setState(() {
        name=data['userProfile']['name'];
        mobile=data['userProfile']['mobile'];
        email=data['userProfile']['email'];


        print('NAme:${name}\nMobile: ${mobile}\n Email:${email}');


      });
    }
  }
  @override
  void initState() {
    super.initState();
    loadPreferences();
    displayName();
  }

  void loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    SharedPreferences.getInstance().then((value) => prefs = value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('CUSTOMER ID BOTTOMBAR:::${widget.cId}');
    return prefs == null
        ? CircularProgressIndicator() // Show loading indicator until prefs are loaded
        : Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          HomePage(
            cid: widget.cId.toString(),
            name: name.toString(),email: email.toString(),
            mobile: mobile.toString(),
          ),
          Tickets(cId: widget.cId.toString(),),
          Profile(
            prefs: prefs,
            cId: widget.cId,
            name: name.toString(),
            mobile: mobile.toString(),
            email: email.toString(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        currentIndex: currentPageIndex,
        selectedItemColor: AppColors.primary,
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.home),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.tickets),
            icon: Icon(CupertinoIcons.ticket),
            label: "My Booking",
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(CupertinoIcons.profile_circled),
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
