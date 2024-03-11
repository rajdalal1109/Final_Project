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
  int currentPageIndex = 0;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return prefs == null
        ? CircularProgressIndicator() // Show loading indicator until prefs are loaded
        : Scaffold(
            body: IndexedStack(
              index: currentPageIndex,
              children: [
                HomePage(
                  name: '',
                ),
                Tickets(),
                Profile(prefs: prefs),
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
                  icon: Icon(CupertinoIcons.tickets),
                  label: "Tickets",
                ),
                BottomNavigationBarItem(
                  icon: const Icon(CupertinoIcons.profile_circled),
                  label: "Profile",
                ),
              ],
            ),
          );
  }
}
