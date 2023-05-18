import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';
import '../../model/User.dart';

class ProfilePage extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Obx(
        () {
      if (_authController.firebaseUser.value == null) {
        return Center(
          child: Text('No user logged in'),
        );
      } else {
        // User is logged in, fetch user data from Firestore
        return FutureBuilder(
            future: _getUserData(),
    builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
    child: CircularProgressIndicator(),
    );
    } else if (snapshot.hasError) {
      return Center(
        child: Text('Error fetching user data'),
      );
    } else {
      User user = snapshot.data!;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Email: ${user.email}'),
          Text('Phone Number: ${user.phoneNumber}'),
          Text('Name: ${user.name}'),
          Text('Subscription Number: ${user.subscriptionNumber}'),
          Text('ID Number: ${user.idNumber}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _authController.signOut,
            child: Text('Logout'),
          ),
        ],
      );
    }
    },
        );
      }
        },
        ),
    );
  }

  Future<User> _getUserData() async {
    String uid = _authController.firebaseUser.value!.uid;
    var snapshot =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
    var userData = snapshot.data();
    return User(
      email: userData!['email'],
      phoneNumber: userData!['phoneNumber'],
      name: userData['name'],
      subscriptionNumber: userData!['subscriptionNumber'],
      idNumber: userData!['idNumber'],
    );
  }
}
