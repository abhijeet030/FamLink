import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/Controllers/MemberController.dart';
import 'package:untitled1/Widgets/text_field.dart';

import '../../Widgets/BottomSheet.dart';
import '../../Widgets/TextFormfieldWithValidation.dart';
import '../../constants/app_colors.dart';
import '../../constants/color.dart';
import 'AddField.dart';

class AddFieldSheetState extends StatefulWidget {
  const AddFieldSheetState({Key? key}) : super(key: key);

  @override
  _AddFieldSheetState createState() => _AddFieldSheetState();
}

AddMemberController addMemberController = Get.put(AddMemberController());
TextEditingController hobbiesController = TextEditingController();
TextEditingController passionController = TextEditingController();
TextEditingController nicknameController = TextEditingController();

List<TextEditingController> controller = [
  hobbiesController,
  passionController,
  nicknameController,
];

List<Map> memberList = [
  {
    "controller": hobbiesController,
    "label": "Hobbies",
  },
  {
    "controller": passionController,
    "label": "Passion",
  },
  {
    "controller": nicknameController,
    "label": "NickName",
  },
];
final formKeyLink = GlobalKey<FormState>();

class _AddFieldSheetState extends State<AddFieldSheetState> {
  @override
  void initState() {
    memberList = [
      {
        "controller": hobbiesController,
        "label": "Hobbies",
      },
      {
        "controller": passionController,
        "label": "Passion",
      },
      {
        "controller": nicknameController,
        "label": "NickName",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            8, MediaQuery.of(context).size.height * 0.2, 8, 0),
        child: Container(
          decoration: BoxDecoration(
            color: tPurple,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Add Field",
                        style: TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Form(
                  key: formKeyLink,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: memberList.length,
                    itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                onTap: () {
                                  addMemberController.memberInfoObj
                                      .add(memberList[index]);
                                  memberList.removeAt(index);
                                  Get.back();
                                },
                                child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color:
                                            AppColors.primary.withOpacity(0.05),
                                        spreadRadius: 1,
                                        blurRadius: 5)
                                  ]),
                                  child: Card(
                                    // shadowColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                          child: Text(
                                        memberList[index]["label"],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: black,
                                            fontWeight: FontWeight.w400),
                                      )),
                                    ),
                                  ),
                                ),
                              )
                              // TextFormFieldValidation(
                              //   controller: memberList[index]["controller"],
                              //   formKey: formKeyLink,
                              //   label: memberList[index]["label"],
                              // ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
