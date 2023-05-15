import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/ComplaintController.dart';
import '../../model/Complaint.dart';

class ComplaintScreen extends StatefulWidget {
  late final Comlaint? comlaint;

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

String dropdownValue = 'اختر نوع الشكوى';

class _ComplaintScreenState extends State<ComplaintScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _adressController = TextEditingController();
  final _typeController = TextEditingController();
  XFile? _imageFile;
  late String _selectedTypeValue;
  late String _selectedAddressValue;

  @override
  void initState() {
    super.initState();
    if (widget.comlaint != null) {
      _titleController.text = widget.comlaint!.title;
      _descriptionController.text = widget.comlaint!.description;
      _typeController.text = widget.comlaint!.type;
      _adressController.text = widget.comlaint!.address;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
    _adressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'الشكاوي',
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عنوان الشكوى',
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'أدخل عنوان الشكوى',
                      hintStyle: GoogleFonts.cairo(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'تفاصيل الشكوى',
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _descriptionController,
                  minLines: 3,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'أدخل نص الشكوى هنا...',
                    hintStyle: GoogleFonts.cairo(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'نوع الشكوى',
                      style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField(
                      value: _selectedTypeValue,
                      hint: Text('اختر نوع الشكوى'),
                      style: GoogleFonts.cairo(height: 1),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.green)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300)),
                      ),
                      items: <String>[
                        'المجاري',
                        'اضاءة',
                        'بنية التحتية',
                        'الحاويات النفايات'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  'المنطقة',
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField(
                  value: _selectedAddressValue,
                  hint: Text('اختر المنطقة'),
                  style: GoogleFonts.cairo(height: 1),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.green)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                  ),
                  items: <String>[
                    'اضاءة',
                    'اضاءة',
                    'بنية التحتية',
                    'الحاويات النفايات'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    final XFile? imageFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (imageFile != null) {
                      setState(() {
                        _imageFile = imageFile;
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_imageFile != null)
                            Image.file(
                              File(_imageFile!.path),
                              fit: BoxFit.cover,
                            )
                          else
                            Icon(Icons.photo_size_select_actual_outlined),
                          Text(
                            'اضغط للتحميل الصورة',
                            style:
                                GoogleFonts.cairo(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'JPG , JPEG',
                            style:
                                GoogleFonts.cairo(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.comlaint == null) {
                        await ComlaintController().addComlaint(
                          _titleController.text,
                          _descriptionController.text,
                          _selectedTypeValue,
                          _selectedAddressValue,
                          _imageFile!,
                        );
                      } else {}
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF820000),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'ارسال',
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
