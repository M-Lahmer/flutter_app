import 'package:e_shop/dal/photo_dao.dart';
import 'package:e_shop/models/photo.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final PhotoDao photoDao;

  const MyCard({super.key, required this.photoDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contents'),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photoDao.findAllPhotos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          final photos = snapshot.data!;
          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(photos[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
