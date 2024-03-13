import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/UI/setting.dart';
import 'package:project/login.dart';
import 'package:http/http.dart' as http;
import 'package:project/model/userprofile.dart';
import 'package:project/utils/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

userProfile? userData;

class Profile extends StatefulWidget {
  String? name;
  String? mobile;
  String? email;
  final SharedPreferences prefs;
  String? cId;

  Profile({Key? key, required this.prefs, this.cId,this.name,this.mobile,this.email}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();
  Uint8List? _image;
  File? selectedIMage;

  String? mobile;
  String? email;



  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(255, 98, 96, 1),
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            height: 100,
            width: 400,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _getGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _getCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.camera,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Gallery
  Future _getGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });

    // Save image to local storage
    widget.prefs.setString('profile_image', base64Encode(_image!));
    Navigator.of(context).pop();
  }

  //Camera
  Future _getCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });

    // Save image to local storage
    widget.prefs.setString('profile_image', base64Encode(_image!));
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _loadImage();

  }

  Future<void> _loadImage() async {
    String? profileImageString = widget.prefs.getString('profile_image');

    if (profileImageString != null) {
      setState(() {
        _image = base64Decode(profileImageString);
      });
    }
  }

  Future<void> _deleteImage() async {
    widget.prefs.remove('profile_image');
    setState(() {
      _image = null;
    });
  }



  void logout(BuildContext context) async {
    await widget.prefs.setBool('isLoggedIn', false); // Clear login status
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LogIn(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print('PROFILEPAGE::');
    print(widget.name);
    print(widget.email);
    print(widget.mobile);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {
              showImagePickerOption(context);
            },
            icon: const Icon(
              CupertinoIcons.camera_circle_fill,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {
              _deleteImage();
            },
            icon: Icon(
              CupertinoIcons.delete_solid,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 80,
              width: 393,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: AppColors.primary,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  if (_image != null)
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: MemoryImage(_image!),
                    )
                  else
                    const CircleAvatar(
                      radius: 90,
                      backgroundImage:
                      AssetImage("assets/images/girldp2.png"),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    "${widget.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    color: AppColors.secondary,
                    child: ListTile(
                      title: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "${widget.email.toString()}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      trailing: Icon(CupertinoIcons.mail),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Card(
                    color: AppColors.secondary,
                    child: ListTile(
                      title: Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "${widget.mobile}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      trailing: Icon(CupertinoIcons.phone),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Setting()),
                      );
                    },
                    child: Card(
                      color: AppColors.secondary,
                      child: ListTile(
                        title: Text(
                          "Setting",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(CupertinoIcons.gear_alt),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      logout(context);
                    },
                    child: Card(
                      color: AppColors.secondary,
                      child: ListTile(
                        title: Text(
                          "Log Out",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(CupertinoIcons.power),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}