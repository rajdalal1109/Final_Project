import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:project/login.dart';
import 'package:project/registration.dart';

class VerifyEmail extends StatefulWidget {
  String email;

  VerifyEmail({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController _otp = TextEditingController();

  submitOtp() async {
    try {
      var res = await http.post(
          Uri.parse(
              'https://busbooking.bestdevelopmentteam.com/Api/user_verification.php'),
          body: jsonEncode({
            'otp': _otp.text,
            'email': widget.email.toString(),
          }),
          headers: {'content-type': 'application/json; charset=UTF-8'});
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        if (data['STATUS'] == true) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LogIn(),
          ));
        } else if (data['code'] == 0) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(data['message'])));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Registration(),
              ));
        }
        print(res.body);
      } else {
        print('Negative response:::::${res.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
      //background: rgba(255, 98, 96, 1);
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email Verification",
                      style: TextStyle(fontSize: 35),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "Enter Your 4-digit code that you received on your email."),
                    //const Text("OTP will expire soon",style: TextStyle(color: Colors.redAccent),),
                    const SizedBox(height: 20),
                    Text("Email: ${widget.email}"),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _otp,
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter Your OTP Here",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(height: 20),
                    //Text("$_timer"),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: submitOtp,
                      child: Center(child: Text("CONTINUE")),
                    ),
                    const SizedBox(height: 5),
                    /*             Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("If you didn't receive a code!\t"),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Resend",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
