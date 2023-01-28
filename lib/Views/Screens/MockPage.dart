import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:untitled1/Widgets/BottomSheet.dart';
import 'package:untitled1/constants/color.dart';

import '../AddMember/AddMemberSheet.dart';

class MockPage extends StatelessWidget {
  const MockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BottomSheetButton(
            buttonTitle: "Add Member", actions: const [AddMemeberSheet()]),
        BottomSheetButton(
            buttonTitle: "Add Reminder", actions: const [AddMemeberSheet()]),
      ]),
    );
  }
}
