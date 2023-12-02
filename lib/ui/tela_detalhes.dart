import 'package:av2/domain/veiculos.dart';
import 'package:av2/ui/tela_sobre.dart';
import 'package:flutter/material.dart';
import 'package:av2/helpers/veiculo_helper.dart';

class TelaDetalhes extends StatefulWidget {
  const TelaDetalhes({super.key, required this.identificador});

  final int identificador;

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  late int id;
  late Future<Veiculo?> v2;
  Veiculo? v;
  late Future<List> listaTeste;
  final veiculoHelper = VeiculoHelper();
  String textMarca = '';
  String textModelo = '';
  String textAno = '';
  String textCor = '';
  String textPlaca = '';

  @override
  void initState() {
    super.initState();
    id = widget.identificador;

    veiculoHelper.getVeiculo(id).then((value) {
      if (value != null) {
        setState(() {
          v = value;
          textMarca = value.marca;
          textModelo = value.modelo;
          textAno = value.ano.toString();
          textCor = value.cor;
          textPlaca = value.placa;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Meus Veiculos'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TelaSobre()));
                },
                icon: const Icon(Icons.info))
          ],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Marca: ${v?.marca}'),
            Text('Modelo: ${v?.modelo}'),
            Text('Ano: ${v?.ano}'),
            Text('cor: ${v?.cor}'),
            Text('Placa: ${v?.placa}'),
          ]),
        ));
  }
}
