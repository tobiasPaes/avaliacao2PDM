import 'package:av2/domain/veiculos.dart';
import 'package:av2/helpers/veiculo_helper.dart';
import 'package:av2/ui/page_home_list.dart';
import 'package:av2/widgets/form_fiel_custom.dart';
import 'package:flutter/material.dart';

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
                keyboardType: TextInputType.number,
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
                      veiculoHelper.saveVeiculo(v);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageHomeList()),);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Veiculo Cadastrado')));
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme. primary,
                  ),
                  child: Text("Cadastrar Veiculo",
                    style: Theme.of(context).textTheme.labelLarge,
                  ))
            ],
          ),
        ));
  }
}
