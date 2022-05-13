import 'package:flutter/material.dart';
import 'package:app_financas/pages/loginPage/login.dart';
import 'package:app_financas/pages/createCountePage/create_count.dart';

void main() {
  runApp(const App());
}
class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/criarConta' : ((context) => const CreateCountPage())
      },
    );
  }
}