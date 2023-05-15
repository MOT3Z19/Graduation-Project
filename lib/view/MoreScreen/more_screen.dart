import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'المزيد',
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold,color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu,),
          ),
        ),
        body: Column(
          children: [
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('اشتراكاتي',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.person_outline,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('عن البلدية',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.view_timeline_outlined,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('الاعدادات',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.settings_outlined,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('أرقام تهمك',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.call_outlined,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('اتصل بنا',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.email_outlined,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('الأسئلة الشائعة',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.question_mark,color: Colors.black),
              ),
            ),
            Divider(indent: 20,endIndent: 20,thickness: 0.5,),
            ListTile(
              title: Text('تسجيل الدخول',style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 13,color: Colors.red)),
              trailing: Icon(Icons.keyboard_arrow_left),
              leading: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey.shade200,
                ),
                height: 30,
                width: 30,
                child: Icon(Icons.login_outlined,color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
