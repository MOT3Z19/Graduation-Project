import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/add_advertisement_controller.dart';
import 'package:untitled8/controller/add_news_controllr.dart';
import 'package:untitled8/model/advertisement.dart';
import 'package:untitled8/model/news.dart';
import 'package:untitled8/view/news_screen/EditNewsPage.dart';
import 'package:untitled8/view/AdsScreen/add_advertisement.dart';
import 'package:untitled8/view/news_screen/add_news.dart';

import 'EditAdsPage.dart';

class ViewAds extends StatelessWidget {
  final AdsController adsController = Get.put(AdsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text('الاعلانات'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => AddAdsPage());
            },
            child: Icon(Icons.add),
          ),
          body: StreamBuilder<List<Ads>>(
              stream: adsController.adsStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('لايوجد اعلانات'));
                }

                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                List<Ads> adsList = snapshot.data!;

                return ListView.builder(
                  itemCount: adsList.length,
                  itemBuilder: (context, index) {
                    Ads ads = adsList[index];

                    return ListTile(
                      onTap: () {
                        Get.to(() => EditAdsPage(ads: ads));
                      },
                      title: Text(ads.title!,maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(ads.content!,maxLines: 1, overflow: TextOverflow.ellipsis),

                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await adsController.deleteAds(ads.id!);
                        },
                      ),
                    );
                  },
                );
              })),
    );
  }
}
