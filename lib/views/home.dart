import 'package:e_shop/dal/photo_dao.dart';
import 'package:e_shop/models/photo.dart';
import 'package:e_shop/providers/photo_provider.dart';

import 'package:e_shop/values/theme.dart';
import 'package:e_shop/views/cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  final PhotoDao photoDao;
  const DashBoard({super.key, required this.photoDao});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Photo> data = [];

  @override
  Widget build(BuildContext context) {
    data = Provider.of<PhotoProvider>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((_) => MyCard(photoDao: widget.photoDao)))),
            child: const Icon(Icons.shop_rounded),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                alignment: Alignment.topRight,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.all(10)),
                    Column(
                      children: [
                        Icon(Icons.archive_outlined,
                            color: themeApp.iconTheme.color,
                            size: themeApp.iconTheme.size),
                        Text(
                          'Archive',
                          style: themeApp.textTheme.titleMedium,
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    Column(
                      children: [
                        Icon(Icons.delete_forever,
                            color: themeApp.iconTheme.color,
                            size: themeApp.iconTheme.size),
                        Text(
                          'Delete',
                          style: themeApp.textTheme.titleMedium,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onDismissed: (_) {
                setState(() {
                  data.removeAt(index);
                });
              },
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              child: ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].url),
                leading: CircleAvatar(
                  child: Image(image: NetworkImage(data[index].url)),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    widget.photoDao.insertPhoto(data[index]);
                  },
                  child: const CircleAvatar(
                      child: Icon(
                          color: Colors.black,
                          Icons.add_shopping_cart_rounded)),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PhotoProvider>(context, listen: false)
              .add(Photo(albumId: 333, id: 333, title: 'Test', url: ''));
        },
        child: const Icon(Icons.add_a_photo_outlined),
      ),
    );
  }
}
