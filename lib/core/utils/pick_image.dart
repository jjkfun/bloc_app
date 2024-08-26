import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    final pngFile = await   ImagePicker().pickImage(source: ImageSource.gallery);
    if (pngFile!= null){
      return File(pngFile.path);
    }
  } catch (e) {
    return null;
  }
}
