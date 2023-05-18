import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled8/model/Complaint.dart';

import '../../controller/ComplaintController.dart';
import '../../controller/authController.dart';

class ComplaintPage extends StatelessWidget {
  final AuthController _authController = Get.find();
  final ComlaintController _comlaintController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Details'),
      ),
      body: StreamBuilder<List<Comlpaint>>(
        stream: _comlaintController.getComplaintData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final complants = snapshot.data!;
            return ListView.builder(
              itemCount: complants.length,
              itemBuilder: (context, index) {
                final complant = complants[index];
                return ListTile(
                  leading: complant.imageUrl != null
                      ? CircleAvatar(
                    backgroundImage: NetworkImage(complant.imageUrl!),
                  )
                      : null,
                  title: Text(complant.title,style: GoogleFonts.cairo(color: Colors.black),),
                  subtitle: Text(complant.description),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
