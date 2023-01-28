import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:untitled1/constants/color.dart';
import 'package:untitled1/constants/fontWeights.dart';
import 'package:untitled1/user_details_first.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tPurple,
      body: PageView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 37, right: 78),
            child: Column(
              children: [
                SizedBox(
                  height: 196,
                ),
                Text(
                  "Do you recall the last time you spoke with your relatives?",
                  style: TextStyle(
                      fontWeight: boldWeight, fontSize: 36, color: tWhite),
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 37, right: 78),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 196,
                      ),
                      Text(
                        "Get Closer to Everyone!",
                        style: TextStyle(
                            fontWeight: boldWeight,
                            fontSize: 36,
                            color: tWhite),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        "Helps you to contact everyone with just easy way",
                        style: TextStyle(
                            fontWeight: normalWeight,
                            fontSize: 15,
                            color: tWhite),
                      )
                    ],
                  )),
              SizedBox(
                height: 416,
              ),
              MaterialButton(
                height: 46,
                minWidth: 295,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15)),
                onPressed: () {
                  Get.to(() => userDetailFirst());
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: normalWeight,
                    color: tWhite,
                    fontSize: 20,
                  ),
                ),
                color: Color(0xFFFFA500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
