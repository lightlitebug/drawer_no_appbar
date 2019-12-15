import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String PIXABAY_KEY = '13403350-e8adfc746702c4a06a2a67655';
const String BASE_URL = 'https://pixabay.com/api/';

class PixabayPhotoItem {
  final int id;
  final String user;
  final int views;
  final int downloads;
  final int favorites;
  final int webformatHeight;
  final int webformatWidth;
  final String webformatURL;
  bool viewed;

  PixabayPhotoItem({
    this.id,
    this.user,
    this.views,
    this.downloads,
    this.favorites,
    this.webformatHeight,
    this.webformatWidth,
    this.webformatURL,
    this.viewed = false,
  });

  PixabayPhotoItem.fromJson(json)
      : this.id = json['id'],
        this.user = json['user'],
        this.views = json['views'],
        this.downloads = json['downloads'],
        this.favorites = json['favorites'],
        this.webformatHeight = json['webformatHeight'],
        this.webformatWidth = json['webformatWidth'],
        this.webformatURL = json['webformatURL'],
        this.viewed = false;
}

class PixabayPhotos with ChangeNotifier {
  final String url =
      '$BASE_URL/?key=$PIXABAY_KEY&q=yellow+flowers&imeage_type=photo';
  List<PixabayPhotoItem> _photos = [];

  List<PixabayPhotoItem> get photos {
    return [..._photos];
  }

  Future<void> getPixabayPhotos(int page, int perPage) async {
    try {
      final response = await http.get('$url&page=$page&per_page=$perPage');
      final items = json.decode(response.body)['hits'];

      items.forEach((item) {
        final newPhoto = PixabayPhotoItem.fromJson(item);
        _photos.add(newPhoto);
      });

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
