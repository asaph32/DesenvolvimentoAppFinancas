import 'package:app_financas/models/despesas.dart';
import 'package:app_financas/provider/prov_despesa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDespesa extends StatefulWidget {
  const FormDespesa({Key? key}) : super(key: key);

  @override
  State<FormDespesa> createState() => _FormDespesaState();
}

class _FormDespesaState extends State<FormDespesa> {

  final _formDespesa = GlobalKey<FormState>();
  final Map<String, dynamic> _formDataDespesa= {};

  @override
  Widget build(BuildContext context) {

    ProviderDespesa despesa = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Despesa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formDespesa,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Titulo"),
                onSaved: (value) => _formDataDespesa['tituloDespesa'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Tipo"),
                onSaved: (value) => _formDataDespesa['tipoDespesa'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Valor"),
                onSaved: (value) => _formDataDespesa['valorDespesa'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Data: dia/mes/ano",
                ),
                onSaved: (value) => _formDataDespesa['dataDespesa'] = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 147, right: 147, top: 15, bottom: 15),
                  primary: Theme.of(context).colorScheme.tertiary,
                ),
                onPressed: () {
                  _formDespesa.currentState?.save();
                  despesa.putDespesa(Despesa(
                    tituloDespesa: _formDataDespesa['tituloDespesa'],
                    tipoDespesa: _formDataDespesa['tipoDespesa'],
                    valorDespesa: num.parse(_formDataDespesa['valorDespesa']),
                    dataDespesa: _formDataDespesa['dataDespesa'],
                  ));
                  Navigator.pop(context);
                },
                child: Text(
                  "Adicionar Despesa",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}