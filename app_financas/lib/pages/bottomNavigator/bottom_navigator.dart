import 'package:flutter/material.dart';
import 'package:app_financas/pages/homePage/home_page.dart';
import 'package:app_financas/pages/relatorios/relatorios.dart';
import 'package:app_financas/pages/perfil/perfil.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({ Key? key }) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _opcaoSelecionadaTabBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _opcaoSelecionadaTabBar,
          onTap: (opcao) {
            debugPrint("Clicou: $opcao");
            setState(() {
              _opcaoSelecionadaTabBar = opcao;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'Listas'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp),
              label: 'Relatorio'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil'
            ),
          ],
        ),
        body: IndexedStack(
          index: _opcaoSelecionadaTabBar,
          children: const [
            HomePage(),
            Relatorios(),
            Perfil(),
          ],
        ),
      );
  }
}