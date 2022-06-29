import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  void fazerLogin() async {

    final SnackBar snackBar;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: senha.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found.');
        snackBar = const SnackBar(content: Text("Essa conta não existe!"), duration: Duration(seconds: 5),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        snackBar = const SnackBar(content: Text("Senha Incorreta!"), duration: Duration(seconds: 5),);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print("logou");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 140.0,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w200,
                            fontSize: 40,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              FadeAnimatedText('Bem\nVindo'),
                              TypewriterAnimatedText(
                                'Organize\nsuas\nfinanças',
                                speed: const Duration(milliseconds: 120),
                                textStyle: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                            onTap: () {},
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Image(
                        image: AssetImage('assets/imgs/graficos.png'),
                        width: 160,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 147, right: 147, top: 15, bottom: 15),
                      primary: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: fazerLogin,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "ou",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/criarConta');
                    },
                    child: Text(
                      "Cadastrar-se",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                ),
              ],
            )
          )
        ),
      ),
    );
  }
}