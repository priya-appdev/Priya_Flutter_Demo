import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickFromGallery() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1024,
    );

    if (picked == null) return null;
    return File(picked.path);
  }

  Future<File?> pickFromCamera() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxWidth: 1024,
    );

    if (picked == null) return null;
    return File(picked.path);
  }

  //MARK: REFACTOR CODE FOR GALLERY AND CAMERA

  Future<File?> pickImage(ImageSource source) async {
    final XFile? picked = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1024,
    );

    if (picked == null) return null;
    return File(picked.path);
  }

  Future<String> persistFile(File picked) async{
    final dir = await getApplicationCacheDirectory();
    final name = 'profile_${picked.path.hashCode}${extension(picked.path)}';
    await picked.copy(join(dir.path,name));
    return name;
  }
}
