import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentPage = 0;

PageController _pageController = PageController(
  initialPage: 0,
);

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF820000),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(20),
                        bottomStart: Radius.circular(20),
                      ),
                    ),
                    width: double.infinity,
                    height: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'الرئيسية',
                          style: GoogleFonts.cairo(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        clipBehavior: Clip.antiAlias,
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset('assets/image$itemIndex.jpg',
                            fit: BoxFit.cover),
                      ),
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 250,
                        autoPlayInterval: Duration(seconds: 3),
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 2.0,
                        initialPage: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadiusDirectional.circular(20),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/invoice.png',
                            width: 60,
                            height: 50,
                          ),
                        ),
                      ),
                      Text(
                        'فاتورتي',
                        style: GoogleFonts.cairo(fontSize: 18),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadiusDirectional.circular(20),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/smartphone.png',
                            width: 60,
                            height: 50,
                          ),
                        ),
                      ),
                      Text(
                        'ارقام الطوارى',
                        style: GoogleFonts.cairo(fontSize: 18),
                      ),
                    ],
                  ),
                  Spacer(),


                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20 ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'أخر الاخبار',
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(onPressed: (){}, child: Text('عرض الكل',style: GoogleFonts.cairo(color: Colors.redAccent),))
                      ],
                    ),
                    SizedBox(height: 10,),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 150),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                          itemBuilder: (context,index){
                        return Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                          ),
                          margin: EdgeInsetsDirectional.only(end: 10),
                          height: 50,
                          width: 250,
                          child: Stack(
                            children: [

                              Opacity( opacity: 0.9,
                              child: Image.asset('assets/image0.jpg',fit: BoxFit.cover,height: 150, width: 250,)),
                              Positioned(
                                width:230,
                                bottom: 10,
                                left: 10,
                                child: Text('اعلان خارجي للتعاقد مع محصلين ميدانين بنظام المقاولة',overflow: TextOverflow.ellipsis,maxLines: 2,style: GoogleFonts.cairo(
                                  fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold
                                ),),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                          'الاعلانات',
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        TextButton(onPressed: (){}, child: Text('عرض الكل',style: GoogleFonts.cairo(color: Colors.redAccent),))
                      ],
                    ),
                    SizedBox(height: 5,),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 100),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context,index){
                            return Container(

                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadiusDirectional.circular(10),

                              ),
                              margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
                              height: 100,
                              width: 250,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Text('اعلان خارجي للتعاقد مع محصلين ميدانين بنظام المقاولة',maxLines: 2,style: GoogleFonts.cairo(
                                      fontSize: 16,
                                    ),),
                                  ),
                                  Row(children: [
                                    Icon(Icons.calendar_month_outlined,color: Colors.black,),
                                    Text('منذ 11 يوم', style: GoogleFonts.changa(
                                      color: Colors.redAccent,
                                    ),),
                                  ],),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
