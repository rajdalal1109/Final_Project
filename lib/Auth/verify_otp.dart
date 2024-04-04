import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:BusBuddy/Auth/forgot_pass.dart';
import 'package:BusBuddy/Auth/newpass.dart';
import 'package:pinput/pinput.dart';
import 'package:BusBuddy/utils/appcolor.dart';

class VerifyOtp extends StatefulWidget {
  final String email;

  const VerifyOtp({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController _otp = TextEditingController();


  void submitOtp() async
  {
    try{
      var response = await http.post(
          Uri.parse(
              'https://busbooking.bestdevelopmentteam.com/Api/submitotp.php'),
          body: jsonEncode({
            'otp': _otp.text,
            'email': widget.email.toString(),
          }),
          headers: {'content-type': 'application/json; charset=UTF-8'});
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      var responseBody = jsonDecode(response.body);
      if (responseBody['STATUS'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Create New Password!'),
            duration: Duration(seconds: 5),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 50),
          ),
        );
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewPass(
                  email: widget.email.toString(),
                )));
      } else if(responseBody['STATUS'] == false ) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Otp is wrong please reenter'),
            duration: Duration(seconds: 5),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 50),
          ),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPass(),));
      }
    }catch(e)
    {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final otptheme = PinTheme(
      height: 56,
      width: 60,
      textStyle: TextStyle(
          fontSize: 20,
          color: Colors.black
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary,width: 2),
      ),
    );

    print(widget.email);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text("Verify Your Email",style: TextStyle(color: AppColors.primary,fontSize: 22,fontWeight: FontWeight.w600),),
      ),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 15, right: 15),
          child: Column(
            children: [
              Image.asset("assets/images/auth/forgot.png",height: 224,width: 300,),
              const SizedBox(height: 40),
              Text("Please Enter the verification code sent to",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.primary),),
              Text("${widget.email}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.primary),),
              const SizedBox(height: 30),
              Pinput(
                length: 4,
                defaultPinTheme: otptheme,
                focusedPinTheme: otptheme.copyWith(
                    decoration:otptheme.decoration!.copyWith(
                      border: Border.all(color: AppColors.primary),
                    )
                ),
                controller: _otp,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  submitOtp();// Submit the login
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
                        "Send",
                        style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you didn't receive a code!\t"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPass(),
                        ));
                      },
                      child: Text(
                        "Resend",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}