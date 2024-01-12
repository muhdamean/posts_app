import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<String> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      return image?.path ?? '';
    } catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }

  static Future<CroppedFile?> cropImage(String path) async {
    try {
      final result = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      );
      return result;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
