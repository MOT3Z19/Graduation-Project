import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/add_news_controllr.dart';
import 'package:untitled8/model/news.dart';
import 'package:untitled8/view/news_screen/EditNewsPage.dart';
import 'package:untitled8/view/news_screen/add_news.dart';

class ViewNews extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text('الاخبار'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddNewsPage());
            },
            child: Icon(Icons.add),
          ),
          body: StreamBuilder<List<News>>(
              stream: newsController.newsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('لا يوجد أخبار'));
                }

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                List<News> newsList = snapshot.data!;

                return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    News news = newsList[index];

                    return ListTile(
                      onTap: () {
                        Get.to(() => EditNewsPage(news: news));
                      },
                      title: Text(news.title!,maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(news.content!,maxLines: 1, overflow: TextOverflow.ellipsis),
                      leading: news.imageUrl != null
                          ? Container(
                          width: 30,
                          height: 30,
                          child: Image.network(news.imageUrl!))
                          : Icon(Icons.article),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await newsController.deleteNews(news.id!);
                        },
                      ),
                    );
                  },
                );
              })),
    );
  }
}
