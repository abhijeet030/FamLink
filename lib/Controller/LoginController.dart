import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginMemberController extends GetxController {
  RxMap userData = {}.obs;
  void updateUserData(Map value) {
    userData.value = value;
  }
}
