import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/anime_model.dart';

class AnimeLocalDataSource {
  Database? database;

  getDatabase() async {
    if (database != null) return database;
    database = await _initDatabase();
    return database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'anime_favorites.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
    CREATE TABLE favorites (
      anime_id TEXT PRIMARY KEY,
      title TEXT,
      image TEXT,
      episodes TEXT,
      status TEXT  
    )
  ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
              'ALTER TABLE favorites ADD COLUMN status TEXT DEFAULT "favorite"');
        }
      },
    );
  }

  Future<void> insertAnime(
      {required AnimeModel anime, required String status}) async {
    Database db = await getDatabase();
    await db.insert(
      'favorites',
      {
        ...anime.toJson(),
        "status": status,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAnime({required String animeId}) async {
    Database db = await getDatabase();
    await db.delete('favorites', where: 'anime_id = ?', whereArgs: [animeId]);
  }

  Future<List<AnimeModel>> getFavorites() async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'status = ?',
      whereArgs: ['favorite'],
    );

    return List.generate(maps.length, (i) => AnimeModel.fromJson(maps[i]));
  }

  Future<List<AnimeModel>> getWatching() async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'status = ?',
      whereArgs: ['watching'],
    );

    return List.generate(maps.length, (i) => AnimeModel.fromJson(maps[i]));
  }

  Future<bool> isFavorite({required String animeId}) async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db
        .query('favorites', where: 'anime_id = ?', whereArgs: [animeId]);

    return maps.isNotEmpty;
  }

  Future<bool> isWatchingNow({required String animeId}) async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'anime_id = ? AND status = ?',
      whereArgs: [animeId, 'watching'],
    );

    return maps.isNotEmpty;
  }
}
