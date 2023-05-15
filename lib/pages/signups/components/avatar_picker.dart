import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPicker extends StatefulWidget {
  final Function(File image) onImagePicked;
  const AvatarPicker({Key? key, required this.onImagePicked}) : super(key: key);

  @override
  AvatarPickerState createState() => AvatarPickerState();
}

class AvatarPickerState extends State<AvatarPicker> {
  File image = File("");
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        widget.onImagePicked(image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getImage,
      child: CircleAvatar(
        backgroundImage: image != File("") ? FileImage(image) : null,
        radius: 50,
        child: image != File("")
            ? Icon(
                Icons.camera_alt,
                size: 40,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
