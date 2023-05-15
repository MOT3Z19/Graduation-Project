import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled8/view/AdsScreen/view_advertisement.dart';
import 'package:untitled8/view/news_screen/view_news.dart';

import 'ComplantScreen/ComplaintsView.dart';

class HomeSceen extends StatelessWidget {
  const HomeSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'الصفحة الرئيسية',
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text(
                'عرض الاخبار',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){
                Get.to(() => ViewNews());
              },
            ),
            ListTile(
              leading: Icon(Icons.ads_click),

              title: Text(
                'عرض الاعلانات',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){
                Get.to(() => ViewAds());
              },
            ),
            ListTile(
              leading: Icon(Icons.view_carousel_outlined),

              title: Text(
                'عرض الشكاوي',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){
                Get.to(() => ComlaintScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
