import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoEditScreen extends StatefulWidget {
  const PhotoEditScreen({Key? key}): super(key: key);

  @override
  State createState() => _PhotoEditScreenState();

}

class _PhotoEditScreenState extends State<PhotoEditScreen> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: imageFile == null? Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text("Import Photo")),
            ElevatedButton(
                onPressed: () {
                  _getFromGallery();
                },
                child: Text("ca"))
          ],
       ): Container(
         child: Image.file(imageFile!)
       )
     );
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(pickedFile!.path);
    });

  }

}