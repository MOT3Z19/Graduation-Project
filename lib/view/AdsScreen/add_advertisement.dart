import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled8/controller/add_advertisement_controller.dart';
import 'package:untitled8/controller/add_news_controllr.dart';

class AddAdsPage extends StatelessWidget {
  final AdsController adsController = Get.find();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('اضافة الاعلانات'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  label: Text(
                    'عنوان الاعلان',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.w400),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                minLines: 4,
                maxLines: 5,
                controller: _contentController,
                decoration: InputDecoration(
                  label: Text(
                    'محتوى الاعلان',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.w400),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                    MaterialStateProperty.all(Size(double.infinity, 50))),
                onPressed: () async {
                  await adsController.addAds(
                    _titleController.text,
                    _contentController.text

                  );
                  Get.back();
                },

                child: Text('اضافة الاعلان',style: GoogleFonts.cairo(fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
