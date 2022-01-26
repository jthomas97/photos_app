import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:photos_app/models/models.dart';
import 'package:photos_app/screens/screens.dart';

class PhotoCard extends StatelessWidget {
  final List<Photo> photos;
  final int index;
  final Photo photo;

  const PhotoCard({@required this.photo, this.photos, this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => PhotoViewerScreen(
            currentIndex: index,
            photos: photos,
          ),
        ),
      ),
      child: Hero(
        tag: Key('${index}_${photo.id}'),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
            image: DecorationImage(
                image: CachedNetworkImageProvider(photo.url),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
