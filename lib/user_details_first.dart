import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:untitled1/Controller/LoginController.dart';
import 'package:untitled1/constants/color.dart';
import 'package:untitled1/intro_page.dart';
import 'package:untitled1/text_field.dart';
import 'package:untitled1/user_form_page.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'constants/fontWeights.dart';

class userDetailFirst extends StatefulWidget {
  const userDetailFirst({super.key});

  @override
  State<userDetailFirst> createState() => _userDetailFirstState();
}

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneNumberController = TextEditingController();
TextEditingController _birthDateController = TextEditingController();
LoginMemberController loginMemberController = Get.put(LoginMemberController());
var _ismale = [false, true];

class _userDetailFirstState extends State<userDetailFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 111,
          ),
          Container(
              margin: EdgeInsets.only(left: 37, right: 200),
              child: Text(
                "Hello, Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w600),
              )),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: AppTextField(_nameController, "Name", false),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: AppTextField(_emailController, "Email", false),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: AppTextField(_phoneNumberController, "Phone Number", false),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: ToggleButtons(
              constraints: const BoxConstraints(minHeight: 0, minWidth: 160),
              borderWidth: 1.0,
              borderColor: tPurple,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              selectedBorderColor: tPurple,
              selectedColor: tPurple,
              fillColor: tPurple,
              color: tGrey,
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  _ismale[0]
                      ? _ismale = [false, true]
                      : _ismale = [true, false];
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Text(
                    "Male",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: _ismale[0] ? white : black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Text("Female",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _ismale[0] ? black : white)),
                )
              ],
              isSelected: _ismale,
            ),
          ),
          Obx(() => CupertinoButton(
              child: Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: 350,
                    height: 57,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.white, spreadRadius: 1, blurRadius: 5)
                    ]),
                    child: Text(
                      loginMemberController.userData["date"] ?? "Birth Date",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              onPressed: () {
                DatePicker.showDatePicker(context, showTitleActions: true,
                    onChanged: (date) {
                  print('change $date in time zone ' + date.toString());
                }, onConfirm: (date) {
                  loginMemberController.userData["date"] =
                      date.toString().substring(0, 10);
                  _birthDateController.text = date.toString().substring(0, 10);
                }, currentTime: DateTime.now());
              })),
          SizedBox(
            height: 100,
          ),
          MaterialButton(
            height: 46,
            minWidth: 295,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15)),
            onPressed: () {
              loginMemberController.userData["name"] = _nameController.text;
              loginMemberController.userData["email"] = _emailController.text;
              loginMemberController.userData["contact"] =
                  _phoneNumberController.value;
              loginMemberController.userData["gender"] = _ismale[0];
              Get.to(userForm());
            },
            child: Text(
              "Next Page",
              style: TextStyle(
                fontWeight: normalWeight,
                color: tWhite,
                fontSize: 20,
              ),
            ),
            color: tPurple,
          ),
        ],
      ),
    );
  }
}
