import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Auth/forgot_pass.dart';
import 'package:project/UI/bottombar.dart';
import 'package:project/registration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late final SharedPreferences prefs;

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
    // }else{
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn(),));
    // }
  }

  @override
  void dispose() {
    _mail.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _saveLoginStatus() async {
    await prefs.setBool('isLoggedIn', true);
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 35,),
                  Image(image: AssetImage("assets/images/login.png"),height: 233,width: 390,),
                  const Text("Welcome",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,)),
                  const Text("You are just one step away",style: TextStyle(fontWeight: FontWeight.w100,fontSize: 15)),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _mail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mail,color: Colors.blue,),
                      labelText: "E-Mail*",
                      hintText: "E-Mail",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      return (!value!.contains("@") || !value.contains(".")) ? "Please enter proper e-mail address" : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: !_passVisible,
                    controller: _password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon:const Icon(Icons.password),
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
                      return (value.length < 6 && value.contains(RegExp(r'[a-zA-z0-9!@#%^&*]'))) ? 'Password must be at least 6 characters long' : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      child: const Text("Log In"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login operation here
                          // If login is successful, save login status
                          _saveLoginStatus().then((_) {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => BottoBar(),
                            ));
                          });
                        }
                      },
                    ),
                  ),
                  const Text("Are you a new user?"),
                  TextButton(
                    child: const Text("Register Here"),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const Registration(),
                      ));
                    },
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