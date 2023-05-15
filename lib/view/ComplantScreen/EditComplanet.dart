

 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
 import 'package:untitled8/controller/ComplaintController.dart';
 import 'package:untitled8/controller/add_advertisement_controller.dart';
 import 'package:untitled8/controller/add_news_controllr.dart';
 import 'package:untitled8/model/advertisement.dart';
 import 'package:untitled8/model/news.dart';

 import '../../model/Complaint.dart';


 class EditComplantPage extends StatelessWidget {
   final ComlaintController messageController = Get.find();

   late Comlaint comlaint;

   final TextEditingController _statusController = TextEditingController();



   EditComplantPage(
       {required this.comlaint}) {
     _statusController.text = comlaint.status!;
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Status'),
       ),
       body: Padding(
         padding: EdgeInsets.all(16),
         child: Column(
           children: [
             TextField(
               controller: _statusController,
               decoration: InputDecoration(hintText: 'Title'),
             ),

             ElevatedButton(
               onPressed: () async {
                 await messageController.updateComlaint(
                   comlaint.id!,
                  _statusController.text,
                 );
                 Get.back();
               },
               child: Text('Update'),
             ),
           ],
         ),
       ),
     );
   }
 }
