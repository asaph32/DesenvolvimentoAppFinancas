import 'package:app_financas/models/receitas.dart';
import 'package:app_financas/provider/prov_receita.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormReceita extends StatefulWidget {
  const FormReceita({Key? key}) : super(key: key);

  @override
  State<FormReceita> createState() => _FormReceitaState();
}

class _FormReceitaState extends State<FormReceita> {

  final _formReceita = GlobalKey<FormState>();
  final Map<String, dynamic> _formDataReceita= {};

  @override
  Widget build(BuildContext context) {

    ProviderReceita receita = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Receita"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formReceita,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Titulo"),
                onSaved: (value) => _formDataReceita['tituloReceita'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Tipo"),
                onSaved: (value) => _formDataReceita['tipoReceita'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Valor"),
                onSaved: (value) => _formDataReceita['valorReceita'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Data: dia/mes/ano"),
                onSaved: (value) => _formDataReceita['dataReceita'] = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(left: 147, right: 147, top: 15, bottom: 15),
                  primary: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  _formReceita.currentState?.save();
                  receita.putReceita(Receita(
                    tituloReceita: _formDataReceita['tituloReceita'],
                    tipoReceita: _formDataReceita['tipoReceita'],
                    valorReceita: num.parse(_formDataReceita['valorReceita']),
                    dataReceita: _formDataReceita['dataReceita'],
                  ),);
                  Navigator.pop(context);
                },
                child: Text(
                  "Adicionar Receita",
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