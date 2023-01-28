import 'package:flutter/material.dart';
import 'package:untitled1/Views/Screens/LandingPage.dart';
import '../ReusableViews/MemberSpecsCell.dart';

class MemberDetailPage extends StatefulWidget {
  const MemberDetailPage({Key? key}) : super(key: key);

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xffFFA500)),
            child: const AppBarContent(showBackBtn: true,),
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
                  MemberSpecsCell(),
                  MemberSpecsCell(),
                  MemberSpecsCell(),
                  MemberSpecsCell(),
                  MemberSpecsCell(),
                  MemberSpecsCell(),
                  MemberSpecsCell(),
                  MemberSpecsCell(),
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
