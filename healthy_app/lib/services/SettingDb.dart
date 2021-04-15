import 'package:healthy_app/services/setting.dart';
import 'package:sqflite/sqflite.dart';

class SettingDB {
  final String tableName = 'settingTable';
  final String columnAmount = 'amountOfDrinks';
  final String columnTime = 'timeToRemind';
  final String columnId = 'id';
  final String columnMedium = 'medium';

  SettingDB._();
  static final SettingDB settingDB = SettingDB._();

  Database? _db;

  Future<Database?> get database async {
    if (_db != null) {
      return _db;
    }

    _db = await openTheDatabase();

    return _db;
  }

  Future<Database> openTheDatabase() async {
    var databasePath = await getDatabasesPath();
    var dir = databasePath + "setting.db";

    var openDb = await openDatabase(
      dir,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          create table $tableName(
            $columnId integer primary key autoincrement,
            $columnMedium integer not null,
            $columnAmount integer not null,
            $columnTime integer not null
          )
          ''');
      },
    );

    Setting setting = Setting(
      amountOfDrinks: 1,
      id: null,
      medium: true,
      timeToRemind: 10,
    );

    insert(setting);

    return openDb;
  }

  void insert(Setting settings) async {
    final db = await this.database;
    var result = await db!.insert(tableName, settings.toJson());
    print("result:  $result");
  }

  Future<List<Setting>> getSetting() async {
    List<Setting> settingList = [];

    final db = await this.database;
    final result = await db!.query(tableName);

    result.forEach((setting) {
      var settingInfo = Setting.fromJson(setting);
      settingList.add(settingInfo);
    });

    return settingList;
  }

  Future<void> update(Setting settings) async {
    final db = await this.database;
    final result = await db!.update(
      tableName,
      settings.toJson(),
      where: '$columnId = ?',
      whereArgs: [settings.id],
    );
    print('result: $result');
  }
}
