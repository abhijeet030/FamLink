// import 'dart:convert';
//
// import 'package:get/get.dart';
//
// import 'package:http/http.dart' as http;
//
// PostMemberApi(String previous, String current, int tableFilter) async {
//   var jsonData;
//   try {
//     Map data = {"lower_range": "1990-01-01", "upper_range": current};
//     String body = json.encode(data);
//
//     final response = await http.post(
//         Uri.parse(
//             "http://192.168.1.35:8000/members/post/"),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization': "JWT ${taskController.jwtToken.value}"
//         },
//         body: body);
//
//     jsonData = json.decode(response.body);
//
//     if (response.statusCode == 200) {
//     } else if (response.statusCode == 409) {
//       print("conflict");
//       return "conflict";
//     } else {
//       print("unsuscessfull");
//     }
//   } catch (e) {
//     print(e.toString());
//     return e.toString();
//   }
// }
