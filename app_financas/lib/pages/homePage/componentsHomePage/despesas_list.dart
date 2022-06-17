import 'package:app_financas/models/despesas.dart';
import 'package:flutter/material.dart';

class ListDespesa extends StatefulWidget {

  final Despesa despesa;
  const ListDespesa(this.despesa);

  @override
  State<ListDespesa> createState() => _ListDespesasState();
}

class _ListDespesasState extends State<ListDespesa> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.despesa.tituloDespesa),
      subtitle: Text(widget.despesa.tipoDespesa),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "R\$ ${widget.despesa.valorDespesa.toString()}",
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                widget.despesa;
              },
            )
          ]
        ),
      ),
    );
  }
}