import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:BusBuddy/Auth/forgot_pass.dart';
import 'package:BusBuddy/UI/bottombar.dart';
import 'package:BusBuddy/UI/splash_screen.dart';
import 'package:BusBuddy/registration.dart';
import 'package:http/http.dart' as http;
import 'package:BusBuddy/utils/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static const String keycid = "cid";

  String? cId;
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _mail.dispose();
    _Password.dispose();
    super.dispose();
  }

  loginSubmit() async {
    try {
      Map data = {
        "email": _mail.text,
        "password": _Password.text,
      };
      var response = await http.post(
        Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/user_login"),
        body: jsonEncode(data),
        headers: {'Content-Type': "application/json; charset=UTF-8"},
      );
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      var responseBody = jsonDecode(response.body);
      if (responseBody['STATUS'] == true) {

        setState(() {
          cId = responseBody['cid'];
        });

        var shredPref = await SharedPreferences.getInstance();
        shredPref.setString(UiScreenState.keylogin, responseBody['cid']);
        print("DATATA OF PREDFS:$shredPref");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottoBar(
              cId: cId.toString(),
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseBody['message'],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500)),
            showCloseIcon: true,
            elevation: 6,
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColors.secondary,
          ),
        );
        print('CUSTOMER ID::::${cId}');
      } else if (responseBody['STATUS'] == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                responseBody['message'],style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
              ),
            ),
            showCloseIcon: true,
            elevation: 6,
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColors.secondary,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottoBar(),
          ),
        );
      }
    }
    catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Form(
              key: _formKey,
              onChanged: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: AssetImage("assets/images/login.png"),
                    height: 233,
                    width: 390,
                  ),
                  Text("Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: AppColors.primary,
                      )),
                  Text("You are just one step away",
                      style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15, color: AppColors.primary)),
                  const SizedBox(height: 30),
                  TextFormField(
                    // E-Mail
                    controller: _mail,
                    decoration: InputDecoration(
                        labelText: "E-mail*",
                        hintText: "E-Mail",
                        filled: true,
                        fillColor: AppColors.secondary,
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.mail,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        )),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value) || !value.contains("@gmail.com")) {
                        return 'Format is abc123@gmail.com';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    // Password
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: !_passVisible,
                    controller: _Password,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.secondary,
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondary),
                      ),
                      prefixIcon: Icon(Icons.password, color: AppColors.primary, size: 20,),
                      labelText: "Password*",
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(_passVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _passVisible = !_passVisible;
                          });
                        },
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      // Regular expression pattern to validate password format
                      if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{6,}$')
                          .hasMatch(value)) {
                        return ('Password must contain at least one uppercase letter, one lowercase letter,' +
                            ' one number, one special character, and be at least 6 characters long');
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(bottom: 15, right: 1),
                          foregroundColor: Color.fromRGBO(255, 98, 96, 1),
                          textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
                        ),
                        child: Text("Forgot Password ?", style: TextStyle(color: AppColors.primary),),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const ForgotPass(),
                          ));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) { // Validate the form
                        loginSubmit(); // Submit the login
                      } else {
                        // Show a Snackbar indicating that the form fields are not valid
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            behavior: SnackBarBehavior.floating,
                            content: Text("Please fill in all the fields with valid data",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500)),
                            duration: Duration(seconds: 2),
                            elevation: 6,
                            backgroundColor: AppColors.secondary,
                            margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        margin: const EdgeInsets.only(top: 15),
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Are you a new user?", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(5),
                          ),
                          child: Text(
                            "\tRegister Here",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const Registration(),
                            ));
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}