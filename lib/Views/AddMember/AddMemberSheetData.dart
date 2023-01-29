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

class AddMemberSheetData extends StatefulWidget {
  final String name;
  final String phoneNumber;
  const AddMemberSheetData(
      {Key? key, required this.name, required this.phoneNumber})
      : super(key: key);

  @override
  _AddMemberSheetState createState() => _AddMemberSheetState();
}

AddMemberController addMemberController = Get.put(AddMemberController());
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController birthController = TextEditingController();
TextEditingController relationController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController genderController = TextEditingController();
TextEditingController hobbiesController = TextEditingController();
TextEditingController passionController = TextEditingController();
TextEditingController nicknameController = TextEditingController();

List<TextEditingController> controller = [
  nameController,
  phoneNumberController,
  birthController,
  relationController,
  genderController,
  hobbiesController,
  passionController,
  nicknameController,
];

final formKeyLink = GlobalKey<FormState>();

class _AddMemberSheetState extends State<AddMemberSheetData> {
  @override
  @override
  void initState() {
    nameController.text = widget.name ?? "";
    phoneNumberController.text = widget.phoneNumber ?? "";
    addMemberController.updateMemberInfoObj([
      {
        "controller": nameController,
        "formKey": formKeyLink,
        "label": "Full Name",
      },
      {
        "controller": phoneNumberController,
        "formKey": formKeyLink,
        "label": "Phone Number",
      },
      {
        "controller": birthController,
        "formKey": formKeyLink,
        "label": "birthDay",
      },
      {
        "controller": relationController,
        "formKey": formKeyLink,
        "label": "Relation",
      },
      {
        "controller": genderController,
        "formKey": formKeyLink,
        "label": "Gender",
      },
    ]);
    super.initState();
  }

  double _currentSliderValue = 3;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        "Add Member",
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        "Priority",
                        style: TextStyle(
                            fontSize: 16,
                            color: black,
                            fontWeight: FontWeight.w500),
                      ),
                      Slider(
                        activeColor: tYellow,
                        thumbColor: tYellow,
                        value: _currentSliderValue,
                        max: 5,
                        divisions: 5,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  child: Form(
                    key: formKeyLink,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: addMemberController.memberInfoObj.length,
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormFieldValidation(
                                  controller: addMemberController
                                      .memberInfoObj[index]["controller"],
                                  formKey: formKeyLink,
                                  label: addMemberController
                                      .memberInfoObj[index]["label"],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: SizedBox(
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: tYellow,
                    onPressed: () async {
                      formKeyLink.currentState!.validate();
                      Get.to(const AddFieldSheetState());
                    },
                    label: Row(
                      children: const [
                        Icon(Icons.add),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Add Field",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ],
                    ),
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
