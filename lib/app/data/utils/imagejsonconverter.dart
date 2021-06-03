import 'package:flutter_getx_starter/app/core/constant.dart';

/*
* this is ImageJsonConverter to autocomplete relative path with absolute path
* example /media/photo.png 👉 https://www.google.com/api/media/photo.png
* */
class ImageJsonConverter {
  static String? fromJson({String? imageUrl}) {
    try {
      if (imageUrl != null && imageUrl.isNotEmpty) {
        return Constant.HOST_URL + imageUrl;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static String? toJson({String? imageUrl}) {
    try {
      if (imageUrl != null && imageUrl.isNotEmpty && imageUrl.contains(Constant.HOST_URL)) {
        return imageUrl.replaceFirst(Constant.HOST_URL, '');
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
