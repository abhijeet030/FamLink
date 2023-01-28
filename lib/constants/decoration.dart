import 'package:flutter/material.dart';
import 'package:untitled1/constants/spaces.dart';

import 'color.dart';

final BoxDecoration pinPutDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(offset: Offset.fromDirection(1), color: grey, blurRadius: 2),
  ],
  borderRadius: BorderRadius.circular(space_2),
  color: white,
  border: Border.all(
    color: white,
  ),
);
