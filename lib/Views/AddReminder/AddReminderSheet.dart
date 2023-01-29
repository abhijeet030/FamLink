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
import '../AddMember/AddField.dart';

class AddReminderSheet extends StatefulWidget {
  const AddReminderSheet({
    Key? key,
  }) : super(key: key);

  @override
  _AddReminderState createState() => _AddReminderState();
}

AddMemberController addMemberController = Get.put(AddMemberController());
TextEditingController nameController = TextEditingController();
final formKeyLink = GlobalKey<FormState>();

class _AddReminderState extends State<AddReminderSheet> {
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: tPurple,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Cancel",
                    style: TextStyle(
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40.0),
                    child: Text(
                      "Set Reminder",
                      style: TextStyle(
                          fontSize: 18,
                          color: white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 14,
                        color: white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: tYellow,
                    // shadowColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Text(
                        "Select Person",
                        style: const TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: tYellow,
                    // shadowColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Text(
                        "Set Time",
                        style: const TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: tYellow,
                    // shadowColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    // elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Text(
                        "Set Date",
                        style: const TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AppTextField(nameController, "Set Custom reminder", true)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
