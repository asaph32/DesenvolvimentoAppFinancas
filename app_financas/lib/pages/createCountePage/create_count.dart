import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateCountPage extends StatefulWidget {
  const CreateCountPage({ Key? key }) : super(key: key);

  @override
  State<CreateCountPage> createState() => _CreateCountPageState();
}

class _CreateCountPageState extends State<CreateCountPage> {

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool statusCriacaoConta = false;
  String msgError = "";

  void criarConta() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: senha.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha deve conter no minimo 6 digitos');
      } else if (e.code == 'email-already-in-use') {
        print('Ja exite um email com esta conta!');
      }
    } catch (e) {
      print(e);
    }

    email.clear();
    senha.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Criar conta"),
      ),
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
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Crie Sua\nConta!",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w200,
                        fontSize: 48,
                        decoration: TextDecoration.none
                      ),
                    ),
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
                    keyboardType: TextInputType.text,
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
                      padding: const EdgeInsets.only(left: 129, right: 129, top: 15, bottom: 15),
                      primary: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      criarConta();
                    },
                    child: Text(
                      "Criar conta",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Ja tenho conta. Fazer login.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            )
          )
        ),
      ),
    );
  }
}