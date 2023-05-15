import 'package:get/get.dart';
import '../model/User.dart';

class UserController extends GetxController {
  User? _user;

  User? get user => _user;

  void createUserAccount({
    required String email,
    required String username,
    required String mobileNumber,
    required String subscriptionNumber,
    required String password,
  }) {
    // logic for creating user account
    // ...
    // update the user
    _user = User(
      email: email,
      username: username,
      mobileNumber: mobileNumber,
      subscriptionNumber: subscriptionNumber,
      password: password,
    );
    update();
  }
}


