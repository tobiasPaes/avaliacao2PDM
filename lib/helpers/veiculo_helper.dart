import 'package:av2/domain/veiculos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeiculoHelper {
  static final VeiculoHelper _instance = VeiculoHelper.internal();

  factory VeiculoHelper() => _instance;

  VeiculoHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    _db ??= await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String? databasePath = await getDatabasesPath();
    // if (databasePath == null) databasePath = "";
    String path = join(databasePath, "veiculos.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
          "CREATE TABLE ${Veiculo.veiculoTable} ("
          "${Veiculo.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,"
          "${Veiculo.anoColumn} INTEGER,"
          "${Veiculo.corColumn} TEXT,"
          "${Veiculo.marcaColumn} TEXT,"
          "${Veiculo.modeloColumn} TEXT,"
          "${Veiculo.placaColumn} TEXT)"
        );
    });
  }

  Future<Veiculo> saveVeiculo(Veiculo v) async {
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      await dbVeiculo.insert(Veiculo.veiculoTable, v.toMap());
    }
    return v;
  }

  Future<Veiculo?> getVeiculo(int id) async {
    try {
      Database? dbVeiculo = await db;
      if (dbVeiculo != null) {
        List<Map<String, dynamic>> maps = await dbVeiculo.query(Veiculo.veiculoTable,
            columns: [
              Veiculo.anoColumn,
              Veiculo.corColumn,
              Veiculo.idColumn,
              Veiculo.marcaColumn,
              Veiculo.modeloColumn,
              Veiculo.placaColumn
            ],
            where: '${Veiculo.idColumn} = ?',
            whereArgs: [id]);
        if (maps.isNotEmpty) {
          // print(Veiculo.fromMap(maps.first));
          return Veiculo.fromMap(maps.first);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<int> deleteVeiculo(int id) async {
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      return await dbVeiculo.delete(Veiculo.veiculoTable,
          where: "${Veiculo.idColumn} = ?", whereArgs: [id]);
    } else {
      return 0;
    }
  }

  Future<int> updateVeiculo(Veiculo v) async {
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      return await dbVeiculo.update(Veiculo.veiculoTable, v.toMap(),
          where: "${Veiculo.idColumn} = ?", whereArgs: [v.id]);
    } else {
      return 0;
    }
  }

  Future<List> getAll() async {
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      List listMap = await dbVeiculo.query(Veiculo.veiculoTable);
      List<Veiculo> listVeiculos = [];

      for (Map m in listMap) {
        listVeiculos.add(Veiculo.fromMap(m));
      }
      // print(listVeiculos);
      return listVeiculos;
    } else {
      return [];
    }
  }
}
