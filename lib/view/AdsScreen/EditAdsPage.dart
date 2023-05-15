import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled8/controller/add_advertisement_controller.dart';
import 'package:untitled8/controller/add_news_controllr.dart';
import 'package:untitled8/model/advertisement.dart';
import 'package:untitled8/model/news.dart';

class EditAdsPage extends StatelessWidget {
  final AdsController adsController = Get.find();

  final Ads ads;



  EditAdsPage({required this.ads}) {
   ads.title!;
   ads.content!;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                Text(
                  ads.title!,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  ads.content!,
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
