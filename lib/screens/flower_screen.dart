import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:drawer_no_appbar_ex/widgets/main_drawer.dart';
import 'package:drawer_no_appbar_ex/providers/pixabay_photos.dart';
import 'package:drawer_no_appbar_ex/screens/image_detail.dart';

class FlowerScreen extends StatefulWidget {
  static final route = 'flower-screen';

  @override
  _FlowerScreenState createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  int page = 1;
  List<PixabayPhotoItem> photos = [];
  var pixabayProvider;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((_) async {
      pixabayProvider = Provider.of<PixabayPhotos>(context);
      await pixabayProvider.getPixabayPhotos(page, 20);
      photos = pixabayProvider.photos;
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
              'Fail to fetch images from pixabay, check your url or try later!',
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flowers'),
      ),
      body: SafeArea(
        child: pixabayProvider == null
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) {
                          return ImageDetail(photos[index]);
                        }),
                      );
                    },
                    child: GridTile(
                      child: FadeInImage(
                        placeholder:
                            AssetImage('assets/images/placeholder.png'),
                        image: NetworkImage(photos[index].webformatURL),
                        fit: BoxFit.cover,
                      ),
                      footer: GridTileBar(
                        backgroundColor: photos[index].viewed
                            ? Colors.blue[300].withOpacity(0.7)
                            : Colors.black54,
                        title: Text(photos[index].user),
                        subtitle: Text(
                          'views: ${photos[index].views}, favs: ${photos[index].favorites}',
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          page++;

          pixabayProvider = Provider.of<PixabayPhotos>(context);
          await pixabayProvider.getPixabayPhotos(page, 20);
          photos = pixabayProvider.photos;
        },
        tooltip: 'Get more images',
        child: Icon(Icons.add),
      ),
      drawer: MainDrawer(),
    );
  }
}
