import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _marcado = false;

  void funcaoTeste() {
   print('clicou');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children:  [
                Text(
                  "Bem \nVindo!",
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
                  width: 200,
                )
              ],
            ),
            const SizedBox(height: 40),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                fillColor: Colors.red,
                labelText: 'Seu Email',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  )
                ),
                fillColor: Colors.red,
                labelText: 'Senha',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: funcaoTeste, 
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.only(left: 135, right: 135, top: 15, bottom: 15)
              ),
              child: Text(
                "Fazer Login",
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )
            ),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text("Lembrar senha"),
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: _marcado,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? valor) {},
                  )
                ),
                const Text("Esqueceu a senha ?"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Ou",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 30),
            
            GestureDetector(
              child: Text(
                "Cadastrar-se",
                style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/criarConta');
              },
            ),
          ],
        ),
      ),
    );
  }
}