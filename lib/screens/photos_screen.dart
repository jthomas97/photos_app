import 'package:flutter/material.dart';
import 'package:photos_app/repositories/photos/photos_repository.dart';
import 'package:photos_app/models/models.dart';

class PhotosScreen extends StatefulWidget {
  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  String _query = 'programming';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photos'),
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  setState(() {
                    _query = value.trim();
                  });
                }
              },
              decoration: InputDecoration(
                  hintText: 'Search', fillColor: Colors.white, filled: true),
            ),
            Expanded(
              child: FutureBuilder(
                future: PhotosRepository().searchPhotos(query: _query),
                builder: (context, snapShot) {
                  if (snapShot.connectionState == ConnectionState.done) {
                    final List<Photo> photos =
                        snapShot.data == null ? [] : snapShot.data;
                    // print(photos);
                    return GridView.builder(
                      padding: EdgeInsets.all(20.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 15.0,
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return Container(
                          color: Colors.green,
                        );
                      },
                      itemCount: photos.length,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
