import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app_financas/data/data_receita.dart';
import 'package:app_financas/models/receitas.dart';

class ProviderReceita with ChangeNotifier {
  final Map<String, Receita> _itemsReceita = {...dataReceita};

  List<Receita> get allReceita {
    return [..._itemsReceita.values];
  }

  int get countReceita {
    return _itemsReceita.length;
  }

  Receita byIndexReceita(int i) {
    return _itemsReceita.values.elementAt(i);
  }

  num somaTotalReceita() {
    num somaTotalReceita = 0;
    for (int i = 0; i < _itemsReceita.length; i++) {
      somaTotalReceita += _itemsReceita.values.elementAt(i).valorReceita;
    }
    return somaTotalReceita;
  }

  void putReceita(Receita receita) {
    if(receita == null) {
      return;
    }

    //adicionar receita
    final idReceita = Random().nextDouble().toString();
    _itemsReceita.putIfAbsent(idReceita, () => Receita(
      idReceita: idReceita,
      tituloReceita: receita.tituloReceita,
      tipoReceita: receita.tipoReceita,
      valorReceita: receita.valorReceita,
      dataReceita: receita.dataReceita,
    ));

    notifyListeners();
  }

  void removeReceita(Receita receita) {
    if(receita != null && receita.idReceita != null) {
      _itemsReceita.remove(receita.idReceita);
      notifyListeners();
    }
  }

}