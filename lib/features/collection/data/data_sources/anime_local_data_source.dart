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
      version: 4, // زود رقم النسخة لتفعيل التحديث
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE AnimeCollection (
          anime_id TEXT,
          title TEXT,
          image TEXT,
          episodes TEXT,
          status TEXT,
          PRIMARY KEY (anime_id, status) -- مفتاح مركب لمنع تكرار نفس الانمي في نفس القائمة
        )
      ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 4) {
          await db
              .execute('ALTER TABLE AnimeCollection RENAME TO temp_old_table');
          await db.execute('''
          CREATE TABLE AnimeCollection (
            anime_id TEXT,
            title TEXT,
            image TEXT,
            episodes TEXT,
            status TEXT,
            PRIMARY KEY (anime_id, status)
          )
        ''');
          await db.execute('''
          INSERT INTO AnimeCollection (anime_id, title, image, episodes, status)
          SELECT anime_id, title, image, episodes, status FROM temp_old_table
        ''');
          await db.execute('DROP TABLE temp_old_table');
        }
      },
    );
  }

  Future<void> insertAnime(
      {required AnimeModel anime, required String status}) async {
    Database db = await getDatabase();
    await db.insert(
      'AnimeCollection',
      {
        ...anime.toJson(),
        "status": status,
      },
      conflictAlgorithm: ConflictAlgorithm
          .replace, // سيحذف العنصر القديم لنفس الحالة ويضيف الجديد
    );
  }

  Future<void> removeFavoriteAnime({required String animeId}) async {
    Database db = await getDatabase();
    await db.delete(
      'AnimeCollection',
      where: 'anime_id = ? AND status = ?',
      whereArgs: [animeId, 'favorite'],
    );
  }

  Future<void> removeWatchingAnime({required String animeId}) async {
    Database db = await getDatabase();
    await db.delete(
      'AnimeCollection',
      where: 'anime_id = ? AND status = ?',
      whereArgs: [animeId, 'watching'],
    );
  }

  Future<List<AnimeModel>> getFavorites() async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'AnimeCollection',
      where: 'status = ?',
      whereArgs: ['favorite'],
    );

    return List.generate(maps.length, (i) => AnimeModel.fromJson(maps[i]));
  }

  Future<List<AnimeModel>> getWatching() async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'AnimeCollection',
      where: 'status = ?',
      whereArgs: ['watching'],
    );

    return List.generate(maps.length, (i) => AnimeModel.fromJson(maps[i]));
  }

  Future<bool> isWatchingNow({required String animeId}) async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'AnimeCollection',
      where: 'anime_id = ? AND status = ?',
      whereArgs: [animeId, 'watching'], // التأكد من الحالة أيضًا
    );

    return maps.isNotEmpty;
  }

  Future<bool> isFavorite({required String animeId}) async {
    Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'AnimeCollection',
      where: 'anime_id = ? AND status = ?',
      whereArgs: [animeId, 'favorite'], // التأكد من الحالة أيضًا
    );

    return maps.isNotEmpty;
  }
}
