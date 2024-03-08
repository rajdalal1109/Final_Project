import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/UI/homepage_1.dart';
import 'package:project/UI/profile.dart';
import 'package:project/UI/ticket.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottoBar extends StatefulWidget {
  const BottoBar({Key? key}) : super(key: key);

  @override
  State<BottoBar> createState() => _BottoBarState();
}

class _BottoBarState extends State<BottoBar> {

  final TextEditingController _number = TextEditingController();
  final TextEditingController _mail = TextEditingController();

  int currentPageIndex = 0;
  late SharedPreferences prefs;


  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    SharedPreferences.getInstance().then((value) => prefs = value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return prefs == null ? CircularProgressIndicator() // Show loading indicator until prefs are loaded
        : Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          HomePage(name: '',),
          Tickets(),
          Profile(prefs: prefs, mail: '', number: '',),
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
            activeIcon: Icon(CupertinoIcons.home),
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.tickets),
            icon: Icon(CupertinoIcons.ticket),
            label: "Tickets",
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