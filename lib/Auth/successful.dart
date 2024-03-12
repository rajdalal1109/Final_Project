//import 'package:apidemo/login.dart';
import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/utils/appcolor.dart';

class Done extends StatefulWidget {
  // const Done({super.key});
  const Done({Key? key}) : super(key: key);

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/auth/pass_change.png"),
              const SizedBox(height: 40),
              Text("Password changed \n      Successfully", style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700,color: AppColors.primary),),
              const SizedBox(height: 30),
              Text("You can now use your new password to log in to \n                                your account! ",style: TextStyle(color: AppColors.primary,fontSize: 14,fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));// Submit the login
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Container(
                    margin: const EdgeInsets.only(top: 15),
                    // width: 250,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}