import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Views/Screens/MemberDetailPage.dart';
import 'package:untitled1/constants/textStyles.dart';

class MemberCell extends StatelessWidget {
  const MemberCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MemberDetailPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.asset("assets/son.png"),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, bottom: 10, right: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Utkarsh Rastogi",
                            style: kLabel,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Last called : Yesterday, 10:00 am",
                            style: kSubLabel,
                          )
                        ],
                      ),
                      Spacer(),
                      Image.asset("assets/lit.png")
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
