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
      version: 1,
      onCreate: (db, version) async {
        db.execute('''
          CREATE TABLE favorites (
            anime_id TEXT PRIMARY KEY,
            title TEXT,
            image TEXT,
            episodes TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertAnime({required AnimeModel anime}) async {
    Database db = await getDatabase();
    await db.insert(
      'favorites',
      anime.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteAnime({required String animeId}) async {
    Database db = await getDatabase();
    await db.delete('favorites', where: 'anime_id = ?', whereArgs: [animeId]);
  }

  Future<List<AnimeModel>> getAllFavorites() async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return List.generate(maps.length, (i) => AnimeModel.fromJson(maps[i]));
  }

  Future<bool> isFavorite({required String animeId}) async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db
        .query('favorites', where: 'anime_id = ?', whereArgs: [animeId]);

    return maps.isNotEmpty;
  }
}
