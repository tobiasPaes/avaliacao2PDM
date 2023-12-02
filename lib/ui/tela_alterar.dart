import 'package:av2/domain/veiculos.dart';
import 'package:av2/ui/tela_sobre.dart';
import 'package:av2/widgets/form_fiel_custom.dart';
import 'package:flutter/material.dart';
import 'package:av2/helpers/veiculo_helper.dart';

class TelaAltera extends StatefulWidget {
  const TelaAltera({super.key, required this.identificador});

  final int identificador;

  @override
  State<TelaAltera> createState() => _TelaAlteraState();
}

class _TelaAlteraState extends State<TelaAltera> {
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.identificador;
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TelaSobre()));
                },
                icon: const Icon(Icons.info))
          ],
        ),
      body: FormVeiculoAltera(
        id: id,
      ),
    );
  }
}

class FormVeiculoAltera extends StatefulWidget {
  const FormVeiculoAltera({super.key, required this.id});
  final int id;

  @override
  // ignore: no_logic_in_create_state
  State<FormVeiculoAltera> createState() => _FormVeiculoAlteraState(id: id);
}

///////////////////////////////

class _FormVeiculoAlteraState extends State<FormVeiculoAltera> {
  _FormVeiculoAlteraState({required this.id});

  final int id;
  final _formKey = GlobalKey<FormState>();
  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final anoController = TextEditingController();
  final corController = TextEditingController();
  final placaController = TextEditingController();
  final veiculoHelper = VeiculoHelper();

  Veiculo? v;

  void soPegando() async {
    v = await veiculoHelper.getVeiculo(id);
    if (v != null) {
      marcaController.text = v!.marca;
      modeloController.text = v!.modelo;
      anoController.text = v!.ano.toString();
      corController.text = v!.cor;
      placaController.text = v!.placa;
    }
  }

  @override
  void initState() {
    super.initState();
    soPegando();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FormFieldCustom(
                controller: marcaController,
                labelText: "Marca",
                validateFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione uma marca';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: modeloController,
                labelText: "Modelo",
                validateFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione um modelo';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: anoController,
                labelText: "Ano",
                validateFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione um ano';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: corController,
                labelText: "Cor",
                validateFunction: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adicione uma cor';
                  }
                  return null;
                },
              ),
              FormFieldCustom(
                controller: placaController,
                labelText: "Placa",
                validateFunction: (value) {
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
                      veiculoHelper.updateVeiculo(v);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Atualizar Veiculo"))
            ],
          ),
        ));
  }
}
