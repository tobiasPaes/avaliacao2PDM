import 'package:av2/ui/tela_sobre.dart';

import 'package:flutter/material.dart';

import '../widgets/form_veiculo_body.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TelaSobre()));
              },
              icon: const Icon(Icons.info))
        ],
        title: const Text("Cadastre um veiculo"),
      ),
      body: const FormVeiculoBody(),
    );
  }
}

