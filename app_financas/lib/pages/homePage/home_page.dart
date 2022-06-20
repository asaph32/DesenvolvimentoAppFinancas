import 'package:app_financas/models/receitas.dart';
import 'package:app_financas/models/despesas.dart';
import 'package:app_financas/pages/homePage/componentsHomePage/resceitas_list.dart';
import 'package:app_financas/pages/homePage/componentsHomePage/despesas_list.dart';
import 'package:app_financas/provider/prov_despesa.dart';
import 'package:app_financas/provider/prov_receita.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String esolhaMostrarReceitaDespesa = "r";

  @override
  Widget build(BuildContext context) {

    final ProviderReceita receitas = Provider.of(context, listen: true);
    final ProviderDespesa despesas = Provider.of(context, listen: true);

    num totalReceita = receitas.somaTotalReceita();
    num totalDespesas = despesas.somaTotalDespesa();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Theme.of(context).colorScheme.secondary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Selecione uma opcão:'),
                      ElevatedButton(
                        child: Text(
                          'Adcionar Receita',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/formReceita');
                        }, //aqui abrira modal de Receita
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      ElevatedButton(
                        child: Text(
                          'Adcionar Despesa',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/formDespesa');
                        }, //aqui abrira modal de despesa
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).colorScheme.tertiary,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 180,
                  height: 95,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Receita:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "R\$ $totalReceita",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 35.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 180,
                  height: 95,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Despesas:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "R\$ $totalDespesas",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 35.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text(
                      "Mostrar Receita",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    value: "r",
                    groupValue: esolhaMostrarReceitaDespesa,
                    activeColor: Theme.of(context).colorScheme.primary,
                    onChanged: (String? escolha) {
                      setState(() {
                        esolhaMostrarReceitaDespesa = escolha!;
                      });
                    }
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text(
                      "Mostrar Despesa",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    value: "d",
                    groupValue: esolhaMostrarReceitaDespesa,
                    activeColor: Theme.of(context).colorScheme.tertiary,
                    onChanged: (String? escolha) {
                      setState(() {
                        esolhaMostrarReceitaDespesa = escolha!;
                      });
                    }
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 5,
                child: Container(
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: esolhaMostrarReceitaDespesa == "r" ? receitas.countReceita : despesas.countDepesa,
                itemBuilder: (context, index) => 
                esolhaMostrarReceitaDespesa == "r" ?
                ListReceita(receitas.byIndexReceita(index)) :
                ListDespesa(despesas.byIndexDespesa(index)) 
              ),
            )
          ],
        ),
      ),
    ); 
  }
}