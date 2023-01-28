import 'package:flutter/material.dart';

import '../../constants/textStyles.dart';

class MemberSpecsCell extends StatelessWidget {
  const MemberSpecsCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 16),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffE5E5E5),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        height: 85,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
            Text("Name",style: kLabel,),
            SizedBox(width: 40,),
            Text("Utkarsh Rastogi",style: kLabel,)
          ],),
        ),
      ),
    );
  }
}
