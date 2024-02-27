import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/Auth/verify_otp.dart';
import 'package:provider/provider.dart';

import '../Provider/auth_provider.dart';



class ForgotPass extends StatefulWidget {

  // const ForgotPass({super.key});
  const ForgotPass({Key? key}) : super(key: key);
  @override
  State<ForgotPass> createState() => _ForgotPassState();
}
class _ForgotPassState extends State<ForgotPass> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mail = TextEditingController();
  bool _isEmailValid = false;

  @override
  void dispose() {
    _mail.dispose();
    super.dispose();
  }

  // void ForgotPass() async
  // {
  //   try
  //     {
  //       var response = await http.post(Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/forgetpwd.php"),
  //       body: jsonEncode({"email" :_mail.text}),
  //         headers: {'Content-Type':"application/json; charset=UTF-8" },
  //       );
  //       if(response.statusCode==200){
  //         print(response.body);
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('otp sent')));
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtp(email: _mail.text),));
  //       }
  //
  //     }
  //   catch(e)
  //     {
  //       print(e);
  //     }
  // }
  void ForgotPass() async {
    if (_formKey.currentState!.validate()) {
      try {
        var response = await http.post(
          Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/forgetpwd.php"),
          body: jsonEncode({"email": _mail.text}),
          headers: {'Content-Type': "application/json; charset=UTF-8"},
        );
        if (response.statusCode == 200) {
          print(response.body);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent and It will be expire in 2 Minutes !!'),
                duration: Duration(seconds: 5),
                elevation: 10,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(bottom: 50),

              )
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtp(email: _mail.text),));
        }
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter an email address'))); // Snackbar to notify user to add email
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
        surfaceTintColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);,
      ),
      backgroundColor: const Color.fromRGBO(255, 98, 96, 1),//background: rgba(255, 98, 96, 1);
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Forgot Password",
                          style: TextStyle(fontSize: 35),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                            "Enter Your email for the verification process, we will send a 4-digit code to your email."),
                        const SizedBox(height: 20),
                        Center(
                          child: TextFormField(
                            controller: _mail,
                            decoration: const InputDecoration(
                              labelText: "E-Mail*",
                              hintText: "Enter Your E-mail ID",
                              prefixIcon: Icon(Icons.mail, color: Colors.blue),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                _isEmailValid = value.contains('@') && value.contains('.');
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return _isEmailValid ? null : "Please enter a valid email address";
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          onPressed:ForgotPass,
                          child: const Center(child: Text("CONTINUE")),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}