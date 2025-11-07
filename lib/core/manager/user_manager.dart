import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
@LazySingleton()
class UserManager extends GetxController {
  // static UserManager get to => Get.find<UserManager>();

  // final Rx<UserData?> _user = Rx<UserData?>(null);
  // final Rx<EligibilityData?> _userEligibility = Rx<EligibilityData?>(null);
  // final Rx<bool?> _isPremierUser = Rx<bool?>(false);

  // UserData? get user => _user.value;
  // EligibilityData? get userEligibility => _userEligibility.value;
  // bool? get isPremierUser => _isPremierUser.value;
  // void setUser(UserData user) {
  //   _user.value = user;
  // }

  // void clearUserEligibility() {
  //   _userEligibility.value = null;
  // }

  // void setUserEligibility(EligibilityData eligibility, bool isPremierUser) {
  //   _userEligibility.value = eligibility;
  //   _isPremierUser.value = isPremierUser;
  // }

  // void clearUser() {
  //   _user.value = null;
  // }

  // void updateUser(UserData updatedUser) {
  //   _user.value = updatedUser;
  // }
  // bool get isLoggedIn => _user.value != null;
}
