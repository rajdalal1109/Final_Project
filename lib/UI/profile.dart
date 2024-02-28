import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/UI/setting.dart';
import 'package:project/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(color: Colors.white),),
        backgroundColor:  const Color.fromRGBO(255, 98, 96, 1),
        surfaceTintColor:  const Color.fromRGBO(255, 98, 96, 1),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
              clipBehavior: Clip.none,
            children: [
              Container(
                height: 179,
                  width: 393,
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8)),
                    color: Color.fromRGBO(255, 98, 96, 1),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Image.asset("assets/images/girldp2.png",),
                      const SizedBox(height: 8,),
                      const Text("Carla Dakota",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25),),

                      const SizedBox(height: 30,),
                      const Card(
                        child: ListTile(
                          title: Text("Email",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                          subtitle: Text("abc@gmail.com",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
                          trailing: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Card(
                        child: ListTile(
                          title: Text("Phone Number",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                          subtitle: Text("+91\t1234567890",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400)),
                          trailing: Icon(Icons.local_phone_outlined),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Setting(),));
                        },
                        child: const Card(
                          child: ListTile(
                            title: Text("Setting",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            trailing: Icon(Icons.settings_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn(),));
                        },
                        child: const Card(
                          child: ListTile(
                            title: Text("Log Out",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                            trailing: Icon(Icons.power_settings_new_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ]
          ),
        ),
      ),
    );
  }
}
