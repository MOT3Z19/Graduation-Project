import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled8/controller/add_news_controllr.dart';

class AddNewsPage extends StatelessWidget {
  final NewsController newsController = Get.find();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('اضافة الاخبار'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  label: Text(
                    'عنوان الخبر',
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
                  label: Text('محتوى الخبر',
                      style: GoogleFonts.cairo(fontWeight: FontWeight.w400)),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  label: Text('رابط الصورة',
                      style: GoogleFonts.cairo(fontWeight: FontWeight.w400)),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  await newsController.addNews(
                    _titleController.text,
                    _contentController.text,
                    _imageUrlController.text.isNotEmpty
                        ? _imageUrlController.text
                        : null,
                  );
                  Get.back();
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50))),
                child: Text('اضافة الخبر',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
