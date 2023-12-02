import 'package:av2/domain/veiculos.dart';
import 'package:av2/helpers/veiculo_helper.dart';
import 'package:av2/ui/tela_alterar.dart';
import 'package:av2/ui/tela_cadastro.dart';
import 'package:av2/ui/tela_detalhes.dart';
import 'package:av2/ui/tela_sobre.dart';
import 'package:flutter/material.dart';

class PageHomeList extends StatelessWidget {
  const PageHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyPage();
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Meus Veiculos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TelaSobre()));
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: const ListBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaCadastro(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListBody extends StatefulWidget {
  const ListBody({super.key});

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  final veiculoHelper = VeiculoHelper();
  late Future<List> veiculos;

  @override
  void initState() {
    super.initState();
    veiculoHelper.getAll().then((value) {

    });
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
                  return ListItem(veiculo: snapshot.data![i]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Veiculo veiculo;
  const ListItem({super.key, required this.veiculo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaDetalhes(identificador: veiculo.id)));
      },
      onLongPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TelaAltera(identificador: veiculo.id)));
      },
      child: ListTile(
        title: Text(veiculo.placa),
      ),
    );
  }
}
