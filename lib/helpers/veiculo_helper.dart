import 'package:av2/domain/veiculos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeiculoHelper {
  static final VeiculoHelper _instance = VeiculoHelper.internal();

  factory VeiculoHelper() => _instance;

  VeiculoHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String? databasePath = await getDatabasesPath();
    if (databasePath == null) databasePath = "";
    String path = join(databasePath, "veiculos.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "create table ${Veiculo.veiculoTable} (${Veiculo.idColumn} integer primary key autoincrement,"
          "${Veiculo.anoColumn} integer,"
          "${Veiculo.corColumn} text,"
          "${Veiculo.marcaColumn} text,"
          "${Veiculo.modeloColumn} text,"
          "${Veiculo.placaColumn} text)");
    });
  }

  Future<Veiculo> saveVeiculo(Veiculo v) async {
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      v.id = await dbVeiculo.insert(Veiculo.veiculoTable, v.toMap());
    }
    return v;
  }

  Future<Veiculo?> getVeiculo(int id) async {
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      List<Map> maps = await dbVeiculo.query(Veiculo.veiculoTable,
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
      if (maps.length > 0) {
        return Veiculo.fromMap(maps.first);
      } else {
        return null;
      }
    }
    return null;
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

  Future<List> getAll() async{
    Database? dbVeiculo = await db;
    if (dbVeiculo != null) {
      List listMap = await dbVeiculo.query(Veiculo.veiculoTable);
      List<Veiculo> listVeiculos = [];

      for (Map m in listMap) {
        listVeiculos.add(Veiculo.fromMap(m));
      }
      return listVeiculos;
    } else {
      return [];
    }
  }
}
