import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';

import '../Controllers/MemberController.dart';

getMemberApi() async {
  AddMemberController addMemberController = Get.put(AddMemberController());
  var jsonData;

  try {
    final response = await http.get(
      Uri.parse(
          "http://192.168.1.17:8000/members/?uuid=0b5d14f8-1a2a-4e7f-a192-8e37f0538fc8"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );

    jsonData = json.decode(response.body);

    if (response.statusCode == 200) {
      addMemberController.updateMemberInfoObjGet(jsonData);
      print(jsonData);
    } else if (response.statusCode == 409) {
      print("conflict");
      return "conflict";
    } else {
      print('${response.statusCode} error ');
    }
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}
