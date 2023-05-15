import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/ComplaintController.dart';
import '../../model/Complaint.dart';

class MessageFormWidget extends StatefulWidget {
  final Comlaint? comlaint;

  const MessageFormWidget({Key? key, this.comlaint}) : super(key: key);

  @override
  _MessageFormWidgetState createState() => _MessageFormWidgetState();
}

class _MessageFormWidgetState extends State<MessageFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _adressController = TextEditingController();
  final _typeController = TextEditingController();
  XFile? _imageFile;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.comlaint == null ? 'Add Message' : 'Edit Message'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _adressController,
                  decoration: InputDecoration(
                    labelText: 'Adress',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Adress';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _typeController,
                  decoration: InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                if (_imageFile != null)
                  Image.file(
                    File(_imageFile!.path),
                    fit: BoxFit.cover,
                  ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final XFile? imageFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (imageFile != null) {
                            setState(() {
                              _imageFile = imageFile;
                            });
                          }
                        },
                        child: Text('Choose Image'),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (widget.comlaint == null) {
                              await ComlaintController().addComlaint(
                                _titleController.text,
                                _descriptionController.text,
                                _typeController.text,
                                _adressController.text,
                                _imageFile!,
                              );
                            } else {}
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(widget.comlaint == null ? 'Add' : 'Update'),
                      ),
                    ),
                  ],
                ),
                if (widget.comlaint != null) ...[
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await ComlaintController()
                                .deleteComlaint(widget.comlaint!.id);
                            Navigator.of(context).pop();
                          },
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
