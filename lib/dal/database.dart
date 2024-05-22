import 'package:e_shop/dal/photo_dao.dart';
import 'package:e_shop/models/photo.dart';
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Photo])
abstract class AppDatabase extends FloorDatabase {
  PhotoDao get photoDao;
}
