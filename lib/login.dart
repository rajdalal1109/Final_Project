import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/Auth/forgot_pass.dart';
import 'package:project/UI/bottombar.dart';
import 'package:project/registration.dart';
import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String? cId;
  final _formKey = GlobalKey<FormState>();
  bool _passVisible = false;
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void dispose() {
    _mail.dispose();
    _Password.dispose();
    super.dispose();
  }

  Login(BuildContext context) async {
    try {
      if (_mail.text.isEmpty || _Password.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill the all fields'),
          ),
        );
        return;
      }

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
        print('object');
        var data = jsonDecode(response.body);
        if (data['STATUS'] == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottoBar(
                        cId: cId.toString(),
                      )));
          setState(() {
            cId = data['cid'];
          });
          print('CUSTOMEID::::${cId}');
        }
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
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 15)),
                    const SizedBox(height: 15),
                    TextFormField(
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
                        } else if (!value.contains("@") ||
                            !value.contains(".")) {
                          return "Format of abc123@gmail.com";
                        } else if (!RegExp(
                                r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Format of abc123@gmail.com';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
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
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: ElevatedButton(
                        child: const Text("Log In"),
                        onPressed:
                            _isButtonDisabled ? null : () => Login(context),
                        // onPressed: (){
                        //   setState(() {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => MyHomePage(),
                        //     ));
                        //   });
                        // }
                      ),
                    ),
                    const Text("Are you new user?"),
                    TextButton(
                        child: const Text("Register Here"),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const Registration(),
                          ));
                        }),
                    TextButton(
                      child: Text("Forgot Password"),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const ForgotPass(),
                        ));
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
