import 'package:app_financas/models/receitas.dart';
import 'package:flutter/material.dart';

class ListReceita extends StatefulWidget {
  
  final Receita receita;
  const ListReceita(this.receita);

  @override
  State<ListReceita> createState() => _ListReceitaState();
}

class _ListReceitaState extends State<ListReceita> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.receita.tituloReceita),
      subtitle: Text(widget.receita.tipoReceita),
      trailing: SizedBox(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "R\$ ${widget.receita.valorReceita.toString()}",
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            )
          ]
        ),
      ),
    );
  }
}