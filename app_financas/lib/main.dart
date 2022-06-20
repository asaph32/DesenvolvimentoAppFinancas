import 'package:app_financas/pages/homePage/componentsHomePage/form_despesa.dart';
import 'package:app_financas/pages/homePage/componentsHomePage/form_receita.dart';
import 'package:flutter/material.dart';
import 'package:app_financas/pages/loginPage/login.dart';
import 'package:app_financas/pages/createCountePage/create_count.dart';
import 'package:app_financas/pages/bottomNavigator/bottom_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'services/firebase_auth.dart';
import 'package:app_financas/provider/prov_receita.dart';
import 'package:app_financas/provider/prov_despesa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderReceita(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderDespesa(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/AuthGate',
        routes: {
          '/login': (context) => const LoginPage(),
          '/criarConta' : (context) => const CreateCountPage(),
          '/bottom_navigator' : (context) => const BottomNavigator(),
          '/AuthGate' : (context) => const AuthGate(),
          '/formReceita' : (context) => const FormReceita(),
          '/formDespesa' : (context) => const FormDespesa(),
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff12CC02),
            primary: const Color(0xff12CC02),
            secondary: const Color(0xffffffff),
            tertiary: const Color.fromARGB(255, 242, 75, 75),
            brightness: Brightness.light,
          )
        ),
      ),
    );
  }
}