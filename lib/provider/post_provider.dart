import 'package:flutter/material.dart';
import 'package:posts_app/data/model/post.dart';
import 'package:posts_app/data/services/create_post_service.dart';
import 'package:posts_app/data/services/get_post_service.dart';
import 'package:posts_app/data/services/upload_service.dart';
import 'package:posts_app/utils/utils.dart';
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
