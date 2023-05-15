

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/add_news_controllr.dart';
import 'package:untitled8/model/news.dart';


class EditNewsPage extends StatelessWidget {
  final NewsController newsController = Get.find();

  final News news;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  EditNewsPage({required this.news}) {
    _titleController.text = news.title!;
    _contentController.text = news.content!;
    _imageUrlController.text = news.imageUrl ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit News'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: 'Content'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(hintText: 'Image URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await newsController.updateNews(
                  news.id!,
                  _titleController.text,
                  _contentController.text,
                  _imageUrlController.text.isNotEmpty
                      ? _imageUrlController.text
                      : null,
                );
                Get.back();
              },
              child: Text('Update News'),
            ),
          ],
        ),
      ),
    );
  }
}
