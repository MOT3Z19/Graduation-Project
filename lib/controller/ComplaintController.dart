import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../model/Complaint.dart';

class ComlaintController extends GetxController {
  CollectionReference comlaint =
  FirebaseFirestore.instance.collection('Comlaint');
  RxList<Comlaint> messageList = <Comlaint>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;




  @override
  void onInit() {
    super.onInit();
    messageList.bindStream(getComlaint());
  }




  Stream<List<Comlaint>> get comlaintStream {
    return _firestore.collection('Comlaint').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data()!;
        return Comlaint(
          id: doc.id,
          title: data['title'],
          description: data['description'],
          type: data['type'],
          address: doc['address'],
          imageUrl: data['imageUrl'],
          userId:data['userId'],
          status: data['status'],
          time: data['time'],
        );
      }).toList();
    });
  }

  Stream<List<Comlaint>> getComlaint() {
    return comlaint.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Comlaint(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          type: doc['type'],
          address: doc['address'],
          imageUrl: doc['imageUrl'],
          userId:doc['userId'],
          status:doc['status'],
          time: doc['time'],
        );
      }).toList();
    });
  }



  Future<void> addComlaint(
      String title, String description,String address ,String type, XFile imageFile) async {
    String userId = Uuid().v4();

    String imageName = DateTime.now().toString() + '.png';
    Reference ref = FirebaseStorage.instance.ref().child(imageName);
    UploadTask uploadTask = ref.putFile(File(imageFile.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    await comlaint.add({
      'userId': userId,
      'title': title,
      'description': description,
      'type': type,
      'address': address,
      'imageUrl': imageUrl,
      'status' : 'to do',
      'time': DateTime.now(),
    });
  }

  Future<void> deleteComlaint(String id) async {
    await comlaint.doc(id).delete();
  }

  Future<void> updateComlaint(String id, String status) async {
  //  String? imageUrl;
  //  if (imageFile != null) {
  //    String imageName = DateTime.now().toString() + '.png';
  //    Reference ref = FirebaseStorage.instance.ref().child(imageName);
  //    UploadTask uploadTask = ref.putFile(File(imageFile.path));
  //    TaskSnapshot taskSnapshot = await uploadTask;
  //    imageUrl = await taskSnapshot.ref.getDownloadURL();
  //  }
    await comlaint.doc(id).update({
      'status': status,
    });
  }

}
