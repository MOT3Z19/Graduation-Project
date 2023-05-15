import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled8/widget/login%20textfiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white54,
          title: Text(
            'انشاء حساب جديد',
            style: GoogleFonts.cairo(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(15),
                      topStart: Radius.circular(15),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'انشاء حساب جديد',
                        style: GoogleFonts.changa(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'تسجيل الدخول الى حسابك.',
                        style: GoogleFonts.changa(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFiledX(
                        title: 'الاسم كاملا',
                        hint: 'أدخل الاسم كاملا',
                        prefIcon: Icon(Icons.person_outline),
                      ),
                      SizedBox(height: 5,),
                      TextFiledX(
                        title: 'رقم الجوال',
                        hint: 'أدخل رقم الجوال',
                        prefIcon: Icon(Icons.phone_android),
                      ),
                      SizedBox(height: 5,),
                      TextFiledX(
                        title: 'رقم الهوية الخاصة بالاشتراك',
                        hint: 'أدخل رقم الهوية الخاصة بالاشتراك',
                        prefIcon: Icon(Icons.card_membership),
                      ),
                      SizedBox(height: 5,),
                      TextFiledX(
                        title: 'البريد الالكتروني',
                        hint: 'أدخل البريد الالكتروني',
                        prefIcon: Icon(Icons.email_outlined),
                      ),
                      SizedBox(height: 5,),
                      TextFiledX(
                        title: 'رقم اشتراك المياه',
                        hint: 'أدخل رقم اشتراك المياه',
                        prefIcon: Icon(Icons.credit_card),
                      ),
                      SizedBox(height: 5,),
                      TextFiledX(
                        title: 'كلمة المرور',
                        hint: 'أدخل كلمة المرور',
                        prefIcon: Icon(Icons.lock_outline),
                      ),
                      SizedBox(height: 5,),
                      ElevatedButton(onPressed: (){}, child: Text('Si'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
