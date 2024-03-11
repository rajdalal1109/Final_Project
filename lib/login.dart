import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Auth/forgot_pass.dart';
import 'package:project/UI/bottombar.dart';
import 'package:project/registration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  bool _isButtonDisabled = true;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPreferences().then((_) {
      _checkLoginStatus();
    });
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> _checkLoginStatus() async {
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottoBar(),
      ));
    }
  }

  @override
  void dispose() {
    _mail.dispose();
    _Password.dispose();
    super.dispose();
  }

  Future<void> _saveLoginStatus() async {
    await prefs.setBool('isLoggedIn', true);
  }

  void logout(BuildContext context) async {
    await prefs.setBool('isLoggedIn', false); // Clear login status
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LogIn(), // Navigate back to the login screen
    ));
  }

  void Login(BuildContext context) async {
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
      if (response.statusCode == 200) {
        print(response.body);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottoBar()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Invalid UserName or Password',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          showCloseIcon: true,
          elevation: 6,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Color.fromRGBO(255, 98, 96, 1),
          padding: EdgeInsets.all(5),
        ));
      }
    } catch (e) {
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
              onChanged: () {
                setState(() {
                  _isButtonDisabled = !_formKey.currentState!.validate();
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Image(
                    image: AssetImage("assets/images/login.png"),
                    height: 233,
                    width: 390,
                  ),
                  const Text("Welcome",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      )),
                  const Text("You are just one step away",
                      style:
                          TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
                  const SizedBox(height: 25),
                  TextFormField(
                    // E-Mail

                    controller: _mail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.blue,
                      ),
                      labelText: "E-Mail*",
                      hintText: "E-Mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value) ||
                          !value.contains("@gmail.com")) {
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
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.password),
                      labelText: "Password*",
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(_passVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
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
                        return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 6 characters long';
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
                            textStyle: TextStyle(fontWeight: FontWeight.w500)),
                        child: Text(
                          "Forgot Password",
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const ForgotPass(),
                          ));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text("Log In"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform login operation here
                        // If login is successful, save login status
                        _saveLoginStatus().then((_) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => BottoBar(),
                          ));
                        });
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you new user?",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(2),
                          ),
                          child: const Text(
                            "\t\tRegister Here",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 98, 96, 1),
                                fontWeight: FontWeight.bold),
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
