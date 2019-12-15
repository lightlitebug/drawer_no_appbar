import 'package:flutter/material.dart';
import 'package:drawer_no_appbar_ex/providers/pixabay_photos.dart';

class ImageDetail extends StatelessWidget {
  final PixabayPhotoItem photo;

  ImageDetail(this.photo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${photo.user}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              photo.webformatURL,
              height: 300,
              width: double.infinity,
            ),
            SizedBox(height: 10),
            Text(
              'Author: ${photo.user}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Views: ${photo.views}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Favorites: ${photo.views}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Downloads: ${photo.downloads}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Size: ${photo.webformatWidth} x ${photo.webformatHeight}',
                    style: TextStyle(fontSize: 16),
                  ),
                  photo.viewed ? Text('Viewed') : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
