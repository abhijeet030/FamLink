import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:url_launcher/url_launcher.dart';
import '../../Api/GetMemberData.dart';
import '../../Controllers/MemberController.dart';
import '../../Widgets/BottomSheet.dart';
import '../../constants/color.dart';

import 'package:untitled1/Views/Screens/MemberDetailPage.dart';
import 'package:untitled1/Views/Screens/WebView.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Services/NotificationService.dart';

import '../../constants/textStyles.dart';
import '../AddMember/AddMemberSheet.dart';
import '../AddReminder/AddReminderSheet.dart';
import '../ReusableViews/MemberCell.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AddMemberController addMemberController = Get.put(AddMemberController());
  List<bool> selectedList = [true, false];

  @override
  void initState() {
    getMemberApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xffFFA500)),
            child: const AppBarContent(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: GestureDetector(
                    onTap: () {
                      notify();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InAppWebViewPage()),
                      );
                    },
                    child: CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12.0,
                                spreadRadius: 2,
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/reminder.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12.0,
                                spreadRadius: 2,
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/carousel1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12.0,
                                spreadRadius: 2,
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/carousel2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12.0,
                                spreadRadius: 2,
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/reminder.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 12.0,
                                spreadRadius: 2,
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage("assets/reminder.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 170.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 30 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: ToggleButtons(
                    constraints:
                        const BoxConstraints(minHeight: 0, minWidth: 100),
                    borderWidth: 1.0,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    selectedColor: Colors.white,
                    fillColor: Color(0xffFFA500),
                    color: Colors.black,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < selectedList.length; i++) {
                          selectedList[i] = !selectedList[i];
                        }
                      });
                    },
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Text(
                          "Family",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10),
                        child: Text("Friends",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                      )
                    ],
                    isSelected: selectedList,
                  ),
                ),
                Obx(
                  () => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: addMemberController.memberInfoObjGet.length,
                    itemBuilder: (context, index) => Visibility(
                      visible: checkIfFamily(selectedList[0],
                          addMemberController.memberInfoObjGet[index]),
                      child: MemberCell(
                        name: addMemberController.memberInfoObjGet[index]
                            ["name"],
                        gender: addMemberController.memberInfoObjGet[index]
                            ["gender"],
                        index: index,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(color: Color(0xfffffff)),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Expanded(
                    child: BottomSheetButton(
                        buttonTitle: "Add Member",
                        actions: [AddMemeberSheet()]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BottomSheetButton(
                        buttonTitle: "Add Reminder",
                        actions: [AddReminderSheet()]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  final bool showBackBtn;
  const AppBarContent({
    this.showBackBtn = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: showBackBtn,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Icon(Icons.chevron_left, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  child: Image.asset("assets/son.png"),
                  maxRadius: 20,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
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
                    "Welcome back !",
                    style: kSubLabel,
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (showBackBtn) {
                    callNumber("9557029657");
                  } else {
                    // notification screen
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Icon(
                      showBackBtn
                          ? Icons.call
                          : Icons.circle_notifications_sharp,
                      size: 30,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void callNumber(String phoneNumber) async {
  final Uri _phoneUri = Uri(scheme: "tel", path: phoneNumber);
  try {
    if (await canLaunchUrl(_phoneUri)) await launchUrl(_phoneUri);
  } catch (error) {
    throw ("Cannot dial");
  }
}

void notify() {
  LocalNoticeService().addNotification(
    'Raat hogyi h!',
    'Mom & dad ko  "Goodnight" bolde',
    DateTime.now().millisecondsSinceEpoch + 1000,
    channel: 'testing',
  );
}

bool checkIfFamily(bool isFamily, Map member) {
  if (isFamily && member["relation"] != "Friend") {
    return true;
  } else {
    if (!isFamily && member["relation"] == "Friend") {
      return true;
    }
  }
  return false;
}
