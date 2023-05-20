import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AvatarPicker extends StatefulWidget {
  final Function(File image) onImagePicked;
  final Function(String response) setResponse;

  const AvatarPicker(
      {Key? key, required this.onImagePicked, required this.setResponse})
      : super(key: key);

  @override
  AvatarPickerState createState() => AvatarPickerState();
}

class AvatarPickerState extends State<AvatarPicker> {
  File image = File("");
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print("img is $pickedFile");

    if (pickedFile != null) {
      // Send the image to Cloudinary
      widget.setResponse("dfdf");
      await uploadImageToCloudinary(pickedFile.path);

      setState(() {
        image = File(pickedFile.path);
        widget.onImagePicked(image);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImageToCloudinary(String imagePath) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://api.cloudinary.com/v1_1/djecqwc0z/image/upload'));

    // Set your Cloudinary upload preset
    request.fields['upload_preset'] = 'unsigned_1';

    // Add the image file to the request
    request.files.add(await http.MultipartFile.fromPath('file', imagePath));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();

      print('Response: $responseString');
      print('Image uploaded successfully!');
    } else {
      print('Error uploading image: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImage();
      },
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
