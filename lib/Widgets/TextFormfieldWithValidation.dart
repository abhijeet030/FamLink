import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/constants/color.dart';
import 'package:untitled1/constants/fontWeights.dart';

import '../constants/app_colors.dart';

class TextFormFieldValidation extends StatefulWidget {
  final TextEditingController controller;
  final label;
  final formKey;
  final bool? isSummary;

  TextFormFieldValidation({
    Key? key,
    required this.controller,
    required this.formKey,
    required this.label,
    this.isSummary,
  }) : super(key: key);

  @override
  _TextFormFieldValidationState createState() =>
      _TextFormFieldValidationState();
}

class _TextFormFieldValidationState extends State<TextFormFieldValidation> {
  bool error = false;
  FocusNode myFocusNode = FocusNode();
  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
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
            color: AppColors.primary.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5)
      ]),
      child: Card(
        // shadowColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // elevation: 4,
        child: TextFormField(
          maxLines: widget.isSummary != null ? 7 : 1,
          focusNode: myFocusNode,
          onEditingComplete: () {
            print(widget.formKey.currentState!.validate());
            widget.formKey.currentState!.validate();

            FocusScope.of(context).unfocus();
          },
          validator: (value) {
            setState(() {
              if (value!.isEmpty) {
                error = true;
              } else {
                error = false;
              }
            });
          },
          controller: widget.controller,
          onChanged: (text) {
            setState(() {});
          },
          onTap: () {
            setState(() {
              // widget.label = true;
            });
          },
          enabled: true,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            // labelText: 'Document Title',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10),

            labelText: widget.label,
            floatingLabelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: myFocusNode.hasPrimaryFocus ? tYellow : Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: tPurple),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.controller.text != ''
                      ? AppColors.primary.withOpacity(0.8)
                      : error
                          ? Colors.red
                          : AppColors.white.withOpacity(0)),
            ),
            prefixIconConstraints: const BoxConstraints(maxWidth: 48),
          ),
        ),
      ),
    );
  }
}
