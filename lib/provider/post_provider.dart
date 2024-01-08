import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/services/create_post_service.dart';
import 'package:flutter_full_course/data/services/get_post_service.dart';
import 'package:flutter_full_course/data/services/upload_service.dart';
import 'package:flutter_full_course/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';
  String? imagePath;

  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  Future<void> createPost(String token) async {
    String? image;
    if (imagePath != null) {
      image = await upload();
    }
    await CreatePostService(message, image, token).call();
    message = '';
    getPost();
  }

  Future<String> upload() async {
    return await UploadService(imagePath!).call();
  }

  pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      final croppedImage = await Utils.cropImage(path);
      imagePath = croppedImage?.path ?? '';
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteImage() {
    imagePath = null;
    notifyListeners();
  }
}
