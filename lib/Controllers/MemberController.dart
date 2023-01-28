import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AddMemberController extends GetxController {
  RxList contactList = [].obs;
  RxList memberInfoObj = [].obs;

  void updateContactList(List value) {
    contactList.value = value;
  }

  void updateMemberInfoObj(List value) {
    memberInfoObj.value = value;
  }
}
