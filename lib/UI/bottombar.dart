import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:BusBuddy/UI/homepage_1.dart';
import 'package:BusBuddy/UI/profile.dart';
import 'package:BusBuddy/UI/ticket.dart';
import 'package:BusBuddy/model/userprofile.dart';
import 'package:BusBuddy/utils/appcolor.dart';
import 'package:BusBuddy/utils/global_function.dart';
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
  // late SharedPreferences prefs;
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
      GlobalFunction.userProfile = UserProfile.fromJson(data['userProfile']);
      // setState(() {
      //   name=data['userProfile']['name'];
      //   mobile=data['userProfile']['mobile'];
      //   email=data['userProfile']['email'];
      //
      //
      //   print('NAme:${name}\nMobile: ${mobile}\n Email:${email}');
      //
      //
      // });
    }
  }
  @override
  void initState() {
    super.initState();

    displayName();
  }



  @override
  Widget build(BuildContext context) {
    print('CUSTOMER ID BOTTOMBAR:::${widget.cId}');
    return  Scaffold(
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

            cId: widget.cId,

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
