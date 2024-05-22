// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PhotoDao? _photoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Photo` (`id` INTEGER NOT NULL, `albumId` INTEGER NOT NULL, `title` TEXT NOT NULL, `url` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PhotoDao get photoDao {
    return _photoDaoInstance ??= _$PhotoDao(database, changeListener);
  }
}

class _$PhotoDao extends PhotoDao {
  _$PhotoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _photoInsertionAdapter = InsertionAdapter(
            database,
            'Photo',
            (Photo item) => <String, Object?>{
                  'id': item.id,
                  'albumId': item.albumId,
                  'title': item.title,
                  'url': item.url
                },
            changeListener),
        _photoUpdateAdapter = UpdateAdapter(
            database,
            'Photo',
            ['id'],
            (Photo item) => <String, Object?>{
                  'id': item.id,
                  'albumId': item.albumId,
                  'title': item.title,
                  'url': item.url
                },
            changeListener),
        _photoDeletionAdapter = DeletionAdapter(
            database,
            'Photo',
            ['id'],
            (Photo item) => <String, Object?>{
                  'id': item.id,
                  'albumId': item.albumId,
                  'title': item.title,
                  'url': item.url
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Photo> _photoInsertionAdapter;

  final UpdateAdapter<Photo> _photoUpdateAdapter;

  final DeletionAdapter<Photo> _photoDeletionAdapter;

  @override
  Future<List<Photo>> findAllPhotos() async {
    return _queryAdapter.queryList('SELECT * FROM Photo',
        mapper: (Map<String, Object?> row) => Photo(
            albumId: row['albumId'] as int,
            id: row['id'] as int,
            title: row['title'] as String,
            url: row['url'] as String));
  }

  @override
  Stream<Photo?> findPhotoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Photo WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Photo(
            albumId: row['albumId'] as int,
            id: row['id'] as int,
            title: row['title'] as String,
            url: row['url'] as String),
        arguments: [id],
        queryableName: 'Photo',
        isView: false);
  }

  @override
  Future<void> insertPhoto(Photo photo) async {
    await _photoInsertionAdapter.insert(photo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePhoto(Photo photo) async {
    await _photoUpdateAdapter.update(photo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePhoto(Photo photo) async {
    await _photoDeletionAdapter.delete(photo);
  }
}
