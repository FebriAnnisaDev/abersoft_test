// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageService {
  static File? file;
  static var base64;
  static String? pathBase64;

  Future<String> imageToBase64(String imagePath) async {
    final imageBytes = await File(imagePath).readAsBytes();
    return base64Encode(imageBytes);
  }

  static pickImageFromGallery() async {
    final XFile? pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();

      base64 = base64Encode(imageBytes);
      String header = "data:image/png;base64,";
      pathBase64 = header + base64!;
      file = File(pickedFile.path);
      return file;
    } else {
      return null;
    }
  }
}
