import 'dart:io';

import 'package:image_picker/image_picker.dart';

class OrganizationInfo {
  String name;
  String address;
  String country;
  String mission;
  String description;
  int id;
  File image;

  OrganizationInfo({
    this.name = '',
    this.address = '',
    this.country = '',
    this.mission = '',
    this.description = '',
    this.id = -1,
    required this.image,
  });

  factory OrganizationInfo.fromJson(Map<String, dynamic> json) {
    return OrganizationInfo(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      id: json['id'] ?? -1,
      country: json['country'] ?? '',
      mission: json['mission'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] != null ? File(json['image']) : File(''),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['country'] = country;
    data['mission'] = mission;
    data['description'] = description;
    data['image'] = image.path;
    return data;
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }
}
