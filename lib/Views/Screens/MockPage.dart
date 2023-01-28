import 'package:flutter/cupertino.dart';
import 'package:untitled1/Widgets/BottomSheet.dart';
import 'package:untitled1/constants/color.dart';

class MockPage extends StatelessWidget {
  const MockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [BottomSheetButton(buttonTitle: "Add Member", actions: [])],
      ),
    );
  }
}
