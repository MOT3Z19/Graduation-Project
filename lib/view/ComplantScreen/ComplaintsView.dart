import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/ComplaintController.dart';

import '../../model/Complaint.dart';
import 'AddComplaintView.dart';
import 'EditComplanet.dart';

class ComlaintScreen extends StatelessWidget {
  final ComlaintController messController = Get.put(ComlaintController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(() => MessageFormWidget());
        },child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Complants'),
      ),
      body: StreamBuilder<List<Comlaint>>(
        stream: messController.getComlaint(),
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
                  title: Text(complant.title),
                  subtitle: Text(complant.description),
                  trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: () async{
                    await messController.deleteComlaint(complant.id!);
                  }),
                  onTap: () async {
                    Get.to(() => EditComplantPage(comlaint: complant,));
                  },
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
