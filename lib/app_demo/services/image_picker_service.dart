import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {

  final ImagePicker _picker = ImagePicker();
  
  Future<File?> pickFromGallery() async{

    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1024
    );

    if (picked == null) return null;
    return File(picked.path);
  }

  Future<File?> pickFromCamera() async{
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxWidth: 1024);

      if (picked == null) return null;
      return File(picked.path);
  }

  
}