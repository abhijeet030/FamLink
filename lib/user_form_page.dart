import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled1/constants/color.dart';
import 'package:untitled1/constants/fontWeights.dart';

import 'Controller/LoginController.dart';

class userForm extends StatefulWidget {
  const userForm({super.key});

  @override
  State<userForm> createState() => _userFormState();
}

LoginMemberController loginMemberController = Get.put(LoginMemberController());

class _userFormState extends State<userForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tPurple,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 142,
          ),
          Obx(
            () => Container(
              alignment: Alignment.center,
              child: !loginMemberController.userData["gender"]
                  ? Image.asset(
                      'assets/img/sister.png',
                      height: 200,
                      width: 200,
                    )
                  : Image.asset(
                      'assets/img/son.png',
                      height: 200,
                      width: 200,
                    ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "User Details",
            style: TextStyle(
                fontWeight: mediumBoldWeight, fontSize: 25, color: tWhite),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left: 66, right: 66),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: tWhite,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Name",
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 66, right: 66),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: tWhite,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Email",
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 66, right: 66),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: tWhite,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Phone Number",
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
