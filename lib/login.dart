import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Auth/forgot_pass.dart';
import 'package:project/UI/bottombar.dart';
import 'package:project/model/userprofile.dart';
import 'package:project/registration.dart';
import 'package:http/http.dart' as http;
import 'package:project/utils/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
userProfile? userData;

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
    getCidFromSharedPreferences();
  }

  Future<void> getCidFromSharedPreferences() async {
    setState(() {
      cId = prefs.getString(cId.toString());
    });
  }

  // Future<void> saveCidToSharedPreferences(String? cId) async {
  //   await prefs.setString('cId', cId ?? '');
  // }
  //
  // void _login() {
  //   String? newCid = 'example_cid';
  //   saveCidToSharedPreferences(newCid);
  //   setState(() {
  //     cId = newCid;
  //   });
  // }

  Future<void> _checkLoginStatus() async {
    if (prefs == null) {
      return;
    }
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottoBar(),
      ));
    }
  }

  Future<void> _saveLoginStatus(SharedPreferences prefs) async {
    await prefs.setBool('isLoggedIn', true);
  }

  void logout(BuildContext context) async {
    if (prefs == null) {
      // Handle the case when prefs is null
      return;
    }
    await prefs.setBool('isLoggedIn', false); // Clear login status
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LogIn(), // Navigate back to the login screen
    ));
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
        await _saveLoginStatus(prefs);
        setState(() {
          cId = responseBody['cid'];
        });
        //_login();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BottoBar(
                  cId: cId.toString(),
                )
            )
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseBody['message']),
            showCloseIcon: true,
            elevation: 6,
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Color.fromRGBO(255, 98, 96, 1),
            padding: EdgeInsets.all(10),
          ),
        );
        setState(() {
          cId = responseBody['cid'];
        });
        print('CUSTOMER ID::::${cId}');
      } else if (responseBody['STATUS'] == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                responseBody['message'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            showCloseIcon: true,
            elevation: 6,
            duration: Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Color.fromRGBO(255, 98, 96, 1),
            padding: EdgeInsets.all(10),
          ),
        );
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LogIn(),
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
                // setState(() {
                //   _isButtonDisabled = !_formKey.currentState!.validate();
                // });
              },
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
                      style:
                      TextStyle(fontWeight: FontWeight.w100, fontSize: 15,color: AppColors.primary,)),
                  const SizedBox(height: 30),
                  TextFormField(
                    // E-Mail
                    controller: _mail,
                    decoration:  InputDecoration(
                        labelText: "E-mail*",
                        hintText: "E-Mail",
                        filled: true,
                        fillColor:AppColors.secondary,
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        prefixIcon: Icon(
                          CupertinoIcons.mail,color: AppColors.primary,size: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        )
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value == null || value.isEmpty)
                      {
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
                      // fillColor: Color.fromRGBO(255, 98, 96, 0.15),
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
                        borderSide: BorderSide(color:AppColors.secondary),
                      ),
                      prefixIcon: Icon(Icons.password,color: AppColors.primary,size: 20,),
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
                          padding: EdgeInsets.only(bottom: 15,right: 1),
                          foregroundColor:Color.fromRGBO(255, 98, 96, 1),
                          textStyle: TextStyle(fontWeight: FontWeight.w600,color: AppColors.primary),
                        ),
                        child: Text("Forgot Password ?",style: TextStyle(color: AppColors.primary),),
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
                    onTap: () {
                      if (_formKey.currentState!.validate()) { // Validate the form
                        loginSubmit(); // Submit the login
                      } else {
                        // Show a Snackbar indicating that the form fields are not valid
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill in all the fields with valid data"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
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
                      Text("Are you new user?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
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
/**/

// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project/Auth/forgot_pass.dart';
// import 'package:project/UI/bottombar.dart';
// import 'package:http/http.dart' as http;
// import 'package:project/registration.dart';
// import 'package:project/utils/appcolor.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserProfile {
//   String? name;
//   String? mobile;
//   String? email;
//
//   UserProfile({this.name, this.mobile, this.email});
//
//   UserProfile.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     mobile = json['mobile'];
//     email = json['email'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['mobile'] = this.mobile;
//     data['email'] = this.email;
//     return data;
//   }
// }
//
// UserProfile? userData;
//
// class LogIn extends StatefulWidget {
//   const LogIn({Key? key}) : super(key: key);
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   String? cId;
//   final _formKey = GlobalKey<FormState>();
//   bool _passVisible = false;
//   final TextEditingController _mail = TextEditingController();
//   final TextEditingController _Password = TextEditingController();
//   late SharedPreferences prefs;
//
//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences().then(() {
//       _checkLoginStatus();
//     });
//   }
//
//   Future<void> _initSharedPreferences() async {
//     prefs = await SharedPreferences.getInstance();
//     getCidFromSharedPreferences();
//   }
//
//   Future<void> getCidFromSharedPreferences() async {
//     setState(() {
//       cId = prefs.getString('cId');
//     });
//   }
//
//   Future<void> _saveCid(SharedPreferences prefs, String key, String? cId) async {
//     await prefs.setString(key, cId ?? '');
//   }
//
//   Future<void> _checkLoginStatus() async {
//     if (prefs == null) {
//       return;
//     }
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     if (isLoggedIn) {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => BottoBar(),
//       ));
//     }
//   }
//
//   Future<void> _saveLoginStatus(SharedPreferences prefs) async {
//     await prefs.setBool('isLoggedIn', true);
//   }
//
//   void logout(BuildContext context) async {
//     if (prefs == null) {
//       // Handle the case when prefs is null
//       return;
//     }
//     await prefs.setBool('isLoggedIn', false); // Clear login status
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => LogIn(), // Navigate back to the login screen
//     ));
//   }
//
//   @override
//   void dispose() {
//     _mail.dispose();
//     _Password.dispose();
//     super.dispose();
//   }
//
//   loginSubmit() async {
//     try {
//       Map<String, dynamic> data = {
//         "email": _mail.text,
//         "password": _Password.text,
//       };
//       var response = await http.post(
//         Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/user_login"),
//         body: jsonEncode(data),
//         headers: {'Content-Type': "application/json; charset=UTF-8"},
//       );
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       var responseBody = jsonDecode(response.body);
//       if (responseBody['STATUS'] == true) {
//         await _saveLoginStatus(prefs);
//         await _saveCid(prefs, 'cId', responseBody['cid']);
//
//         final userProfileData = UserProfile.fromJson(responseBody);
//         await _saveUserProfile(prefs, 'userProfile', userProfileData);
//
//         setState(() {
//           cId = responseBody['cid'];
//           userData = userProfileData;
//         });
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BottoBar(
//               cId: cId.toString(),
//             ),
//           ),
//         );
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(responseBody['message']),
//             showCloseIcon: true,
//             elevation: 6,
//             duration: Duration(seconds: 1),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             backgroundColor: Color.fromRGBO(255, 98, 96, 1),
//             padding: EdgeInsets.all(10),
//           ),
//         );
//
//         print('CUSTOMER ID::::${cId}');
//       } else if (responseBody['STATUS'] == false) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 responseBody['message'],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             showCloseIcon: true,
//             elevation: 6,
//             duration: Duration(seconds: 1),
//             behavior: SnackBarBehavior.floating,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             backgroundColor: Color.fromRGBO(255, 98, 96, 1),
//             padding: EdgeInsets.all(10),
//           ),
//         );
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LogIn(),
//             ));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Future<void> _saveUserProfile(SharedPreferences prefs, String key, UserProfile userProfile) async {
//     final userProfileMap = userProfile.toJson();
//     final userProfileJson = jsonEncode(userProfileMap);
//     await prefs.setString(key, userProfileJson);
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(35),
//             child: Form(
//               key: _formKey,
//               onChanged: () {},
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Image(
//                     image: AssetImage("assets/images/login.png"),
//                     height: 233,
//                     width: 390,
//                   ),
//                   Text("Welcome",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 32,
//                         color: AppColors.primary,
//                       )),
//                   Text("You are just one step away",
//                       style:
//                       TextStyle(fontWeight: FontWeight.w100, fontSize: 15, color: AppColors.primary)),
//                   const SizedBox(height: 30),
//                   TextFormField(
//                     // E-Mail
//                     controller: _mail,
//                     decoration: InputDecoration(
//                         labelText: "E-mail*",
//                         hintText: "E-Mail",
//                         filled: true,
//                         fillColor: AppColors.secondary,
//                         isDense: true,
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         prefixIcon: Icon(
//                           CupertinoIcons.mail,
//                           color: AppColors.primary,
//                           size: 20,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                         )),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter an email address';
//                       }
//                       if (!RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value) || !value.contains("@gmail.com")) {
//                         return 'Format is abc123@gmail.com';
//                       }
//                       return null;
//                     },
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                   ),
//                   const SizedBox(height: 25),
//                   TextFormField(
//                     // Password
//                     enableSuggestions: false,
//                     autocorrect: false,
//                     obscureText: !_passVisible,
//                     controller: _Password,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: AppColors.secondary,
//                       isDense: true,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                       prefixIcon: Icon(Icons.password, color: AppColors.primary, size: 20),
//                       labelText: "Password*",
//                       hintText: "Password",
//                       suffixIcon: IconButton(
//                         icon: Icon(_passVisible ? Icons.visibility : Icons.visibility_off),
//                         onPressed: () {
//                           setState(() {
//                             _passVisible = !_passVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       }
//                       // Regular expression pattern to validate password format
//                       if (!RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$%^&*]).{6,}$')
//                           .hasMatch(value)) {
//                         return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 6 characters long';
//                       }
//                       return null;
//                     },
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.only(bottom: 15, right: 1),
//                           foregroundColor: Color.fromRGBO(255, 98, 96, 1),
//                           textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary),
//                         ),
//                         child: Text(
//                           "Forgot Password ?",
//                           style: TextStyle(color: AppColors.primary),
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (context) => const ForgotPass(),
//                           ));
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         loginSubmit();
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Please fill in all the fields with valid data"),
//                             duration: Duration(seconds: 2),
//                           ),
//                         );
//                       }
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 15, right: 15),
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 15),
//                         height: 45,
//                         decoration: BoxDecoration(
//                           color: AppColors.primary,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Are you new user?",
//                         style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
//                       ),
//                       TextButton(
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.all(5),
//                           ),
//                           child: Text(
//                             "\tRegister Here",
//                             style: TextStyle(
//                               color: AppColors.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pushReplacement(MaterialPageRoute(
//                               builder: (context) => const Registration(),
//                             ));
//                           }),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   initSharedPreferences() {}
// }

/**/
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project/Auth/forgot_pass.dart';
// import 'package:project/UI/bottombar.dart';
// import 'package:project/model/userprofile.dart';
// import 'package:project/registration.dart';
// import 'package:http/http.dart' as http;
// import 'package:project/utils/appcolor.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// userProfile? userData;
//
// class LogIn extends StatefulWidget {
//   const LogIn({super.key});
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   String? cId;
//   final _formKey = GlobalKey<FormState>();
//   bool _passVisible = false;
//   final TextEditingController _mail = TextEditingController();
//   final TextEditingController _Password = TextEditingController();
//   // bool _isButtonDisabled = true;
//   late SharedPreferences prefs;
//
//     @override
//   void initState() {
//     super.initState();
//     _initSharedPreferences().then((_) {
//       _checkLoginStatus();
//     });
//   }
//
//   Future<void> _initSharedPreferences() async {
//     prefs = await SharedPreferences.getInstance();
//     getCidFromSharedPreferences();
//   }
//
//   Future<void> getCidFromSharedPreferences() async {
//     setState(() {
//       cId = prefs.getString('cId');
//     });
//   }
//
//   Future<void> saveCidToSharedPreferences(String? cId) async {
//     await prefs.setString('cId', cId ?? ''); // Save cId to SharedPreferences
//   }
//
//   void _login() {
//     // After successful login
//     String? newCid = 'example_cid'; // Replace 'example_cid' with the actual value of cId
//     saveCidToSharedPreferences(newCid); // Save cId to SharedPreferences
//     setState(() {
//       cId = newCid;
//     });
//   }
//
//   Future<void> _checkLoginStatus() async {
//     if (prefs == null) {
//       // Handle the case when prefs is null
//       return;
//     }
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     if (isLoggedIn) {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => BottoBar(),
//       ));
//     }
//   }
//
//   Future<void> _saveLoginStatus(SharedPreferences prefs) async {
//     await prefs.setBool('isLoggedIn', true);
//   }
//
//   void logout(BuildContext context) async {
//     if (prefs == null) {
//       // Handle the case when prefs is null
//       return;
//     }
//     await prefs.setBool('isLoggedIn', false); // Clear login status
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (context) => LogIn(), // Navigate back to the login screen
//     ));
//   }
//
//   @override
//   void dispose() {
//     _mail.dispose();
//     _Password.dispose();
//     super.dispose();
//   }
//
//   loginSubmit() async {
//     try {
//       Map data = {
//         "email": _mail.text,
//         "password": _Password.text,
//       };
//       var response = await http.post(
//         Uri.parse("https://busbooking.bestdevelopmentteam.com/Api/user_login"),
//         body: jsonEncode(data),
//         headers: {'Content-Type': "application/json; charset=UTF-8"},
//       );
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       var responseBody = jsonDecode(response.body);
//       if (responseBody['STATUS'] == true) {
//         await _saveLoginStatus(prefs);
//         setState(() {
//           cId = responseBody['cid'];
//         });
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => BottoBar(
//                   cId: cId.toString(),
//                 )
//             )
//         );
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(responseBody['message']),
//             showCloseIcon: true,
//             elevation: 6,
//             duration: Duration(seconds: 1),
//             behavior: SnackBarBehavior.floating,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             backgroundColor: Color.fromRGBO(255, 98, 96, 1),
//             padding: EdgeInsets.all(10),
//           ),
//         );
//         setState(() {
//           cId = responseBody['cid'];
//         });
//         print('CUSTOMER ID::::${cId}');
//       } else if (responseBody['STATUS'] == false) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 responseBody['message'],
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             showCloseIcon: true,
//             elevation: 6,
//             duration: Duration(seconds: 1),
//             behavior: SnackBarBehavior.floating,
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//             backgroundColor: Color.fromRGBO(255, 98, 96, 1),
//             padding: EdgeInsets.all(10),
//           ),
//         );
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => LogIn(),
//             ));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(35),
//             child: Form(
//               key: _formKey,
//               onChanged: () {
//                 // setState(() {
//                 //   _isButtonDisabled = !_formKey.currentState!.validate();
//                 // });
//               },
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Image(
//                     image: AssetImage("assets/images/login.png"),
//                     height: 233,
//                     width: 390,
//                   ),
//                   Text("Welcome",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 32,
//                         color: AppColors.primary,
//                       )),
//                   Text("You are just one step away",
//                       style:
//                       TextStyle(fontWeight: FontWeight.w100, fontSize: 15,color: AppColors.primary,)),
//                   const SizedBox(height: 30),
//                   TextFormField(
//                     // E-Mail
//                     controller: _mail,
//                     decoration:  InputDecoration(
//                         labelText: "E-mail*",
//                         hintText: "E-Mail",
//                         filled: true,
//                         fillColor:AppColors.secondary,
//                         isDense: true,
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                         ),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         prefixIcon: Icon(
//                           CupertinoIcons.mail,color: AppColors.primary,size: 20,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                         ),
//                         disabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: AppColors.secondary),
//                         )
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty)
//                       {
//                         return 'Please enter an email address';
//                       }
//                       if (!RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(value) || !value.contains("@gmail.com")) {
//                         return 'Format is abc123@gmail.com';
//                       }
//                       return null;
//                     },
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                   ),
//                   const SizedBox(height: 25),
//                   TextFormField(
//                     // Password
//                     enableSuggestions: false,
//                     autocorrect: false,
//                     obscureText: !_passVisible,
//                     controller: _Password,
//                     decoration: InputDecoration(
//                       filled: true,
//                       // fillColor: Color.fromRGBO(255, 98, 96, 0.15),
//                       fillColor: AppColors.secondary,
//                       isDense: true,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: AppColors.secondary),
//                       ),
//                       disabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:AppColors.secondary),
//                       ),
//                       prefixIcon: Icon(Icons.password,color: AppColors.primary,size: 20,),
//                       labelText: "Password*",
//                       hintText: "Password",
//                       suffixIcon: IconButton(
//                         icon: Icon(_passVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off),
//                         onPressed: () {
//                           setState(() {
//                             _passVisible = !_passVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (String? value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password is required';
//                       }
//                       // Regular expression pattern to validate password format
//                       if (!RegExp(
//                           r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$%^&*]).{6,}$')
//                           .hasMatch(value)) {
//                         return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 6 characters long';
//                       }
//                       return null;
//                     },
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         style: TextButton.styleFrom(
//                           padding: EdgeInsets.only(bottom: 15,right: 1),
//                           foregroundColor:Color.fromRGBO(255, 98, 96, 1),
//                           textStyle: TextStyle(fontWeight: FontWeight.w600,color: AppColors.primary),
//                         ),
//                         child: Text("Forgot Password ?",style: TextStyle(color: AppColors.primary),),
//                         onPressed: () {
//                           Navigator.of(context).pushReplacement(MaterialPageRoute(
//                             builder: (context) => const ForgotPass(),
//                           ));
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) { // Validate the form
//                         loginSubmit(); // Submit the login
//                       } else {
//                         // Show a Snackbar indicating that the form fields are not valid
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text("Please fill in all the fields with valid data"),
//                             duration: Duration(seconds: 2),
//                           ),
//                         );
//                       }
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 15,right: 15),
//                       child: Container(
//                         margin: const EdgeInsets.only(top: 15),
//                         // width: 250,
//                         height: 45,
//                         decoration: BoxDecoration(
//                           color: AppColors.primary,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Are you new user?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
//                       TextButton(
//                           style: TextButton.styleFrom(
//                             padding: EdgeInsets.all(5),
//                           ),
//                           child: Text(
//                             "\tRegister Here",
//                             style: TextStyle(
//                               color: AppColors.primary,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.of(context)
//                                 .pushReplacement(MaterialPageRoute(
//                               builder: (context) => const Registration(),
//                             ));
//                           }),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }