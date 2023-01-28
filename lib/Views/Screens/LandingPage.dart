import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import '../../constants/textStyles.dart';
import '../ReusableViews/MemberCell.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<bool> selectedList = [true, false];
  String url =
      "https://images.pexels.com/photos/3912384/pexels-photo-3912384.jpeg";

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
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //2nd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //3rd Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      //4th Image of Slider
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 180.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 20 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.7,
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
                          padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                          child: Text(
                            "Family",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                          child: Text("Friends",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        )
                      ],
                      isSelected: selectedList,
                    ),
                  ),
                  MemberCell(),
                  MemberCell(),
                  MemberCell(),
                  MemberCell(),
                  MemberCell(),
                  MemberCell()
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
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const[
                Text("Add member",style: kLabel,),
                SizedBox(width: 30,),
                Text("Add reminder",style: kLabel)
              ],),
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
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(Icons.chevron_left,color: Colors.black),
              ),
                ),),
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
                onTap: (){
                  if(showBackBtn){
                    // notification screen
                  }else{
                    callNumber("9557029657");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child:
                      Icon(showBackBtn ? Icons.call : Icons.circle_notifications_sharp, size: 30, color: Colors.black),
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
  // String url = "tel://" + phoneNumber;
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not call $phoneNumber';
  // }
}