import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled1/Controllers/MemberController.dart';
import 'package:untitled1/Views/AddMember/AddMemberSheetData.dart';

import '../../Widgets/BottomSheet.dart';
import '../../constants/app_colors.dart';
import '../../constants/color.dart';

class AddMemeberSheet extends StatefulWidget {
  const AddMemeberSheet({Key? key}) : super(key: key);

  @override
  _AddMemeberSheetState createState() => _AddMemeberSheetState();
}

AddMemberController addMemberController = Get.put(AddMemberController());

class _AddMemeberSheetState extends State<AddMemeberSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: tPurple,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(),
                    Center(
                      child: Text(
                        "Add Member",
                        style: TextStyle(
                            fontSize: 18,
                            color: white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: grey,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      onChanged: (text) {
                        text = text.toLowerCase();
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: black,
                          ),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: 'Search for  your family & friends '),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: const Text(
                  "All Contacts",
                  style: TextStyle(
                      fontSize: 16, color: white, fontWeight: FontWeight.w500),
                ),
              ),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    itemCount: addMemberController.contactList.length,
                    itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 8),
                        child: CupertinoButton(
                            padding: const EdgeInsets.all(0), // important

                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.male),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          addMemberController
                                              .contactList[index].name.first,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          addMemberController.contactList[index]
                                              .phones.first.number
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => AddMemberSheetData());
                            })),
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
