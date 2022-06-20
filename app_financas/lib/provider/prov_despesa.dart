import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app_financas/data/data_despesa.dart';
import 'package:app_financas/models/despesas.dart';

class ProviderDespesa with ChangeNotifier {
  final Map<String, Despesa> _itemsDespesa = {...dataDespesa};

  List<Despesa> get allDespesa {
    return [..._itemsDespesa.values];
  }

  int get countDepesa {
    return _itemsDespesa.length;
  }

  Despesa byIndexDespesa(int i) {
    return _itemsDespesa.values.elementAt(i);
  }

  num somaTotalDespesa() {
    num somaTotalDespesa = 0;
    for(int i = 0; i < _itemsDespesa.length; i++) {
      somaTotalDespesa += _itemsDespesa.values.elementAt(i).valorDespesa;
    }
    return somaTotalDespesa;
  }

  void putDespesa(Despesa despesa) {
    if(despesa == null) {
      return;
    }

    //adicionar despesa
    final idDespesa = Random().nextDouble().toString();
    _itemsDespesa.putIfAbsent(idDespesa, () => Despesa(
      idDespesa: idDespesa,
      tituloDespesa: despesa.tituloDespesa,
      tipoDespesa: despesa.tipoDespesa,
      valorDespesa: despesa.valorDespesa,
      dataDespesa: despesa.dataDespesa,
    ));

    notifyListeners();
  }

  removeDespesa(Despesa despesa) {
    if(despesa != null && despesa.idDespesa != null) {
      _itemsDespesa.remove(despesa.idDespesa);
      notifyListeners();
    }
  }

}