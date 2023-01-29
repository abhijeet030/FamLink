import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/Views/Screens/LandingPage.dart';
import '../../Controllers/MemberController.dart';
import '../ReusableViews/MemberSpecsCell.dart';

class MemberDetailPage extends StatefulWidget {
  final int index;
  const MemberDetailPage({Key? key, required this.index}) : super(key: key);

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

AddMemberController addMemberController = Get.put(AddMemberController());

class _MemberDetailPageState extends State<MemberDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xffFFA500)),
            child: const AppBarContent(
              showBackBtn: true,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CircleAvatar(
                      minRadius: 80,
                      maxRadius: 80,
                      child: Image.asset("assets/son.png"),
                      backgroundColor: Color(0xff55418E).withOpacity(0.8),
                    ),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MemberSpecsCell(
                            title: "Name",
                            description: addMemberController
                                .memberInfoObjGet[widget.index]["name"]),
                        MemberSpecsCell(
                            title: "gender",
                            description: addMemberController
                                            .memberInfoObjGet[widget.index]
                                        ["gender"] ==
                                    1
                                ? "Male"
                                : "female"),
                        MemberSpecsCell(
                            title: "Relation",
                            description: addMemberController
                                .memberInfoObjGet[widget.index]["relation"]),
                        MemberSpecsCell(
                            title: "priority",
                            description: addMemberController
                                .memberInfoObjGet[widget.index]["priority"]
                                .toString()),
                        MemberSpecsCell(
                            title: "Phone No.",
                            description: addMemberController
                                .memberInfoObjGet[widget.index]["ph_no"]
                                .toString()),
                        MemberSpecsCell(
                            title: "birthDay",
                            description: addMemberController
                                .memberInfoObjGet[widget.index]["birth_day"]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
