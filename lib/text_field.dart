import 'package:flutter/material.dart';
import 'package:untitled1/constants/color.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final bool isSummary;

  AppTextField(
    this.controller,
    this.title,
    this.isSummary, {
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode myFocusNode = FocusNode();

  void initState() {
    widget.controller.addListener(() {
      setState(() {
        widget.controller.value.text != '';
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.blue.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5)
      ]),
      child: Card(
        // shadowColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // elevation: 4,
        child: TextFormField(
          maxLines: widget.isSummary ? 7 : 1,
          focusNode: myFocusNode,
          validator: (value) {},
          onChanged: (text) {},
          onTap: () {
            setState(() {});
          },
          controller: widget.controller,
          enabled: true,
          decoration: InputDecoration(
            labelText: widget.title,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle: TextStyle(
                color: myFocusNode.hasPrimaryFocus ? Colors.blue : Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.controller.text != ''
                      ? Colors.blue.withOpacity(0.8)
                      : tWhite.withOpacity(0)),
            ),
            prefixIconConstraints: const BoxConstraints(maxWidth: 48),
          ),
        ),
      ),
    );
  }
}
