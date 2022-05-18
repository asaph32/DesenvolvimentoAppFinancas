import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void funcaoTeste() {
    debugPrint("clicou");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding: const EdgeInsets.all(20),
          child: Form(
            // key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        "Bem\nVindo!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w200,
                          fontSize: 48,
                          decoration: TextDecoration.none
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Image(
                        image: AssetImage('assets/imgs/graficos.png'),
                        width: 180,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    // controller: email,
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
                    // controller: senha,
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
                      padding: const EdgeInsets.only(left: 147, right: 147, top: 15, bottom: 15)
                    ),
                    onPressed: funcaoTeste,
                    child: const Text(
                      "Login"
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
                  child: Text(
                    "Cadastrar-se",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
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