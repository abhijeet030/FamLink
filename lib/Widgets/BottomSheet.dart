import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/constants/color.dart';

import '../Api/GetMemberData.dart';
import '../Controllers/MemberController.dart';
import '../Views/AddMember/AddMemberSheet.dart';
import '../constants/app_colors.dart';

class BottomSheetButton extends StatefulWidget {
  final String buttonTitle;
  final List<Widget> actions;
  final onPressed;
  const BottomSheetButton(
      {Key? key,
      required this.buttonTitle,
      required this.actions,
      this.onPressed})
      : super(key: key);

  @override
  _BottomSheetButtonState createState() => _BottomSheetButtonState();
}

late List<Contact> contacts;
AddMemberController addMemberController = Get.put(AddMemberController());

class _BottomSheetButtonState extends State<BottomSheetButton> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.all(0), // important
        color: tYellow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Text(
              widget.buttonTitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        onPressed: () async {
          if (await checkPermission()) {
            contacts = await FlutterContacts.getContacts(
                withProperties: true, withPhoto: true);
            addMemberController.updateContactList(contacts);
          }

          showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                    actions: widget.actions,
                  ));
        });
  }
}

Future<bool> checkPermission() async {
  bool permission = await Permission.contacts.isGranted;
  if (!permission) {
    return Permission.contacts.request().isGranted;
  }
  return Permission.contacts.isGranted;
}
