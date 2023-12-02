import 'package:flutter/material.dart';
import 'package:av2/helpers/veiculo_helper.dart';
import 'package:av2/domain/veiculos.dart';

import '../ui/tela_cadastro.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Segunda Prova",
        home: Scaffold(
          appBar: null,
          body: const HomeList(),
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TelaCadastro()));
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final veiculoHelper = VeiculoHelper();
  late Future<List> veiculos;

  @override
  void initState() {
    super.initState();
    veiculos = veiculoHelper.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: veiculos,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    return ListItem(
                      veiculo: snapshot.data![i],
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

class ListItem extends StatelessWidget {
  final Veiculo veiculo;
  const ListItem({super.key, required this.veiculo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      onLongPress: () {},
      child: ListTile(
        title: Text(veiculo.placa),
      ),
    );
  }
}
