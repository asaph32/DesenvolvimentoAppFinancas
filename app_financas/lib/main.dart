import 'package:flutter/material.dart';
import 'package:app_financas/pages/loginPage/login.dart';
import 'package:app_financas/pages/createCountePage/create_count.dart';
import 'package:app_financas/pages/bottomNavigator/bottom_navigator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'services/firebase_auth.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/AuthGate',
      routes: {
        '/login': (context) => const LoginPage(),
        '/criarConta' : (context) => const CreateCountPage(),
        '/bottom_navigator' : (context) => const BottomNavigator(),
        '/AuthGate' : (context) => const AuthGate(),
      },
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff12CC02),
          primary: const Color(0xff12CC02),
          secondary: const Color(0xffffffff),
          brightness: Brightness.light,
        )
      ),
    );
  }
}