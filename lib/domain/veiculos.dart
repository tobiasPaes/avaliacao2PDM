class Veiculo {
  static const String veiculoTable = 'veiculo_table';
  static const String marcaColumn = 'marca';
  static const String modeloColumn = 'modelo';
  static const String anoColumn = 'ano';
  static const String idColumn = 'id';
  static const String placaColumn = 'placa';
  static const String corColumn = 'cor';

  String marca = '';
  String modelo = '';
  int ano = 0;
  int id = 0;
  String placa = '';
  String cor = '';

  Veiculo(this.marca, this.ano, this.modelo, this.placa, this.cor);

  Veiculo.fromMap(Map map) {
    id = map[idColumn];
    marca = map[marcaColumn];
    modelo = map[modeloColumn];
    ano = map[anoColumn];
    cor = map[corColumn];
    placa = map[placaColumn];
  }

  @override
  String toString() {
    return 'Veiculo{placa: $placa, marca: $marca, modelo: $modelo, ano: $ano, cor: $cor}';
  }

  Map<String, dynamic> toMap() {
    return {
      marcaColumn: marca,
      modeloColumn: modelo,
      anoColumn: ano,
      corColumn: cor,
      placaColumn: placa,
      idColumn: id,
    };
  }
}
