import 'package:av2/domain/veiculos.dart';
import 'package:av2/helpers/veiculo_helper.dart';
import 'package:av2/widgets/form_fiel_custom.dart';

import 'package:flutter/material.dart';

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
        title: const Text("Cadastre um veiculo"),
      ),
      body: const FormVeiculoBody(),
    );
  }
}

class FormVeiculoBody extends StatefulWidget {
  const FormVeiculoBody({super.key});

  @override
  State<FormVeiculoBody> createState() => _FormVeiculoBodyState();
}

class _FormVeiculoBodyState extends State<FormVeiculoBody> {
  final _formKey = GlobalKey<FormState>();

  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final anoController = TextEditingController();
  final corController = TextEditingController();
  final placaController = TextEditingController();

  final veiculoHelper = VeiculoHelper();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Cadastrar Veiculo"),
              FormFieldCustom(
                controller: anoController,
                labelText: "Marca",
                validate_function: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione uma marca';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: anoController,
                labelText: "Modelo",
                validate_function: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione um modelo';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: anoController,
                labelText: "Ano",
                validate_function: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione um ano';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: anoController,
                labelText: "Cor",
                validate_function: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione uma cor';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: anoController,
                labelText: "Placa",
                validate_function: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione uma placa';
                  }
                  return null;
                },
              ),
              TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Veiculo v = Veiculo(
                          marcaController.text,
                          int.parse(anoController.text),
                          modeloController.text,
                          placaController.text,
                          corController.text);
                      veiculoHelper.saveVeiculo(v);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Cadastrar Veiculo"))
            ],
          ),
        ));
  }
}
