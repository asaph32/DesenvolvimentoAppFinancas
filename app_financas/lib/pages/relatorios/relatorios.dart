import 'package:app_financas/pages/relatorios/componentsRelatorio/moedas_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/prov_despesa.dart';
import '../../provider/prov_receita.dart';

class Relatorios extends StatefulWidget {
  const Relatorios({ Key? key }) : super(key: key);

  @override
  State<Relatorios> createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {

  @override
  Widget build(BuildContext context) {

    final ProviderReceita receitas = Provider.of(context, listen: true);
    final ProviderDespesa despesas = Provider.of(context, listen: true);

    num lucroLiquido = receitas.somaTotalReceita() - despesas.somaTotalDespesa();

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 350,
                height: 95,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Theme.of(context).colorScheme.primary),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lucro Liquido:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "R\$ $lucroLiquido",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 35.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "Contaçōes:",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: ListMoedas()),
            ],
          ),
        ),
      ),
    );
  }
}