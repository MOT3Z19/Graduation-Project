import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      firebaseUser.value = user;
    });
  }

  Future<void> registerWithEmailAndPassword(
      {required String email,
        required String password,
        required String phoneNumber,
        required String name,
        required String subscriptionNumber,
        required String idNumber}) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'email': email,
        'phoneNumber': phoneNumber,
        'name': name,
        'subscriptionNumber': subscriptionNumber,
        'idNumber': idNumber,
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
